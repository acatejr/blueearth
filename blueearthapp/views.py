import time, urllib, zipfile, os
from osgeo import ogr
from django.conf.urls.defaults import *
from django.conf import settings
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, redirect
from django.contrib.auth import authenticate
from django.contrib.auth.models import User, Group
from django.contrib.auth import login as djlogin
from django.contrib.auth import logout as djlogout
from django.core import serializers
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404

from suds.client import Client
from blueearth.blueearthapp.models import *
from blueearthapp.models import Membership
#from utils import Authenticator

def index(request):
   """
   Handles requests to the site's main page
   TODO: Need to add error catching for no organization associated with user - graceful error trapping
   TODO: Apply design pattern to handling user types
   """
   if request.user and request.user.is_authenticated():
      user = request.user

      if len(user.organization_set.all()) > 0:
         organization = user.organization_set.all()[0]
         #organization = user.organization_set.get()
         if organization.type == 0:
            # if the user is a member of an organization that is classified as an agent then gather
            # agent based info and send to landing page.
            agents = organization.members.all()
            return render_to_response('index.html', {'user':user,
                                                     'agents':agents,
                                                     'google_maps_api':settings.GOOGLE_MAPS_API,
                                                     'media_url':settings.MEDIA_URL})
         elif organization.type == 1:
            #organization = user.organization_set.all()[0]
            #organization = user.organization_set.get()
            properties = organization.property_set.all()

            return render_to_response('index.html', {'user':user,
                                                     'properties':properties,
                                                     'google_maps_api':settings.GOOGLE_MAPS_API,
                                                     'media_url':settings.MEDIA_URL})
         #return HttpResponse(organization)
      else:
         return render_to_response('login.html', {'media_url':settings.MEDIA_URL,'message':'User account error: user not member of organization.'})
   else:
      return render_to_response('login.html', {'media_url':settings.MEDIA_URL})

def mobile(request):
   """
   Handles mobile device requests
   """
   if request.user.is_authenticated():
      return render_to_response('mobile/index.html')
   else:
      return render_to_response('mobile/login.html', {'media_url':settings.MEDIA_URL})

def mobile_login(request):
   """
   Handles mobile login requests
   TODO: This method needs to be cleaned up when selecting the user types properties
   """
   #authenticator = Authenticator()
   #user = authenticator.authenticate(request)
   uid = request.POST['uid']
   pwd = request.POST['pwd']

   user = authenticate(username=uid, password=pwd)

   if user is not None:
      #if user.locked:
      if not user.is_active:
         return render_to_response('disabled.html')
      else:
         #request.session['user'] = user

#         # User is user
#         props = Property.objects.filter(user=user.id).order_by('name')
#
#         # Is user customer
#         if (len(props) == 0):
#            props = Property.objects.filter(customer=user.id)
#
#         # Is user an agent
#         if (len(props) == 0):
#            props = Property.objects.filter(agent=user.id)

#         organization = user.organization_set.all()[0]
#         properties = organization.property_set.all()
#         for p in properties:
#            i = ','.join('{"id":"%s", "layer":"%s", "capture_date":"%s", "type":"%s"}' % (i.id, i.webserver_layer,
#                                                                                          i.capture_date.strftime('%m-%d-%Y'),
#                                                                                          i.imagetype.id) for i in p.image_set.all())

         properties = ""
         organization = user.organization_set.all()[0]
         props = None
         if organization.type == 0:
            props = Property.objects.filter(agent=user.id)
         elif organization.type == 1:
            props = organization.property_set.all()

         for property in props:
            i = ','.join('{"id":"%s", "layer":"%s", "capture_date":"%s", "type":"%s"}' % (i.id, i.webserver_layer,
                                                                                          i.capture_date.strftime('%m-%d-%Y'),
                                                                                          i.imagetype.id) for i in property.image_set.all())

            imgdates = ','.join('"%s"' % (cd.strftime('%m-%d-%Y')) for cd in property.image_set.all().dates('capture_date', 'day'))
            properties += '{"id":"%s", "name":"%s","images":[%s], "image_dates":[%s]}' % (property.id, property.name, i, imgdates) + ","

         if properties[len(properties)-1:len(properties)] == ',':
            properties = properties[0:len(properties)-1]

         properties = "[" + properties + "]"

         imagetypes = ImageType.objects.all()
         return render_to_response('mobile/index.html', {'media_url':settings.MEDIA_URL,
                                                         'google_maps_api':settings.GOOGLE_MAPS_API,
                                                         'properties':properties,
                                                         'imagetypes':imagetypes})
   else:
      return render_to_response('mobile/login.html', {'media_url':settings.MEDIA_URL})

def get_agents(request):
   """ Get all the members of an agency """

   aid = request.GET['aid']
   resp = '';
   agency = Group.objects.filter(id=aid)[0] #Agency.objects.filter(id=aid)[0]
   agents = agency.user_set.all()
   a = ','.join('{"id":"%s","name":"%s %s"}' % (a.id, a.first_name, a.last_name) for a in agents);
   resp = '[%s]' % a
   return HttpResponse(resp, 'application/type=json')

def get_properties(request):
   """
   The user has selected an agent's name whose images the user plans on viewing.
   """
   agentid = request.GET['personid']
   ag = User.objects.filter(id=agentid)
   #membership = Membership.objects.filter(user=ag)
   #orgid = membership.values()[0]['organization_id']
   #organization = Organization.objects.get(id=orgid)

   properties = Property.objects.filter(agent=ag)
   p = ','.join('{"id":"%s","name":"%s"}' % (p.id, p.name) for p in properties);
   resp = '[%s]' % p
   return HttpResponse(resp, 'application/type=json')

def mobile_showmap(request):
   """
   Generates a map for the mobile client
   """
   req = request.path.split('/')
   propid = req[4]
   imgdate = req[5].split('-')
   imgtype = req[6]

   property = Property.objects.filter(id=propid)[0]
   d = '%s-%s-%s' % (imgdate[2],imgdate[0],imgdate[1])
   image = Image.objects.filter(property=propid).filter(capture_date=d).filter(imagetype=imgtype)[0]
   imagetype = ImageType.objects.all()
   imagetype = ImageType.objects.filter(id=imgtype)[0]
   return render_to_response('mobile/map.html', {'media_url':settings.MEDIA_URL,
                                                 'google_maps_api':settings.GOOGLE_MAPS_API,
                                                 'property':property,
                                                 'image':image.webserver_layer,
                                                 'imgdate':req[4],
                                                 'imgtype':imagetype.name,
                                                 'imagetypes':imagetype})

def mobile_logout(request):
   """
   Handles mobile logout requests
   """
   #if 'user' in request.session:
   #   del request.session['user']
   #return HttpResponseRedirect('/blueearth/mobile/')

   djlogout(request)
   return HttpResponseRedirect('/blueearth/mobile/')


def get_property_image_dates(request):
   """
   Get the imagery dates for the selected image.  The return is a string
   formatted as an array of date values where each item is a string.
   2/10/2010 11:28:29 AM - altered property retrieval to get unique property and image dates to query based on property's image set and unique dates
   """
   propid = '%s' % request.GET['propid']
   location = None
   #property = Property.objects.filter(id=propid)
   property = Property.objects.get(id=propid)
   if property:
      location = '{"lat":"%s","lon":"%s","zoom":"%s"}' % (property.center_lat, property.center_lon, property.zoom)

   #images = Image.objects.filter(property=propid)
   #d = ','.join('"%s"' % (i.capture_date.strftime('%m-%d-%Y')) for i in images)
   image_dates = property.image_set.all().dates('capture_date', 'day')
   d = ','.join('"%s"' % (image_date.strftime('%m-%d-%Y')) for image_date in image_dates)
   dates = '[%s]' % d

   resp = '[%s,%s]' % (dates, location)
   return HttpResponse(resp, mimetype='application/text')

def get_image_types(request):
   """
   Get the image types for a given property and date.  Request expects the property id and date.
   2/10/2010 11:33:27 AM Had to add a comma to the begining join string.
   """

   propid = '%s' % request.GET['propid']
   imgdate = '%s' % request.GET['image_date']
   d = time.strptime(imgdate,"%m-%d-%Y") # convert to proper date format
   images = Image.objects.filter(property=propid, capture_date=time.strftime("%Y-%m-%d", d)).order_by('imagetype')
   s = ','.join('{"id":"%s", "name":"%s"}' % (i.imagetype.id, i.imagetype) for i in images)
   resp = "[%s]" % s
   return HttpResponse(resp, mimetype='application/text')

def get_image(request):
   """
   Gets the property id, image date, and image type from the request
   and returns the IWS layer name to show on the map.
   """
   propid = '%s' % request.GET['propid']
   imgdate = '%s' % request.GET['image_date']
   imgtype = '%s' % request.GET['image_type']
   d = time.strptime(imgdate,"%m-%d-%Y") # convert to proper date format
   images = Image.objects.filter(property=propid, capture_date=time.strftime("%Y-%m-%d", d), imagetype=imgtype)
   resp = '%s' % (images[0].webserver_layer)
   return HttpResponse(resp, mimetype='application/text')

def get_elevation(request):
   """
   Dependent on suds package.  Uses the USGS's elevation service to get a lat, lon elevation.
   The service url is http://gisdata.usgs.net/xmlwebservices2/elevation_service.asmx?WSDL
   """

   lon = request.GET['lon']
   lat = request.GET['lat']
   units = 'feet'

   url = 'http://gisdata.usgs.net/xmlwebservices2/elevation_service.asmx?WSDL'
   client = Client(url)
   client.set_options(port='Elevation_ServiceSoap')
   elevation = client.service.getElevation(lon, lat, units, '', 'true').double
   resp = '%s' % (elevation)
   return HttpResponse(resp, mimetype='application/text')

def get_map_link(request):
   """
   Handles map link generation
   """

   #url = "http://%s/beisite/basic_map/%s/%s/%s/%s" % (settings.HOST_NAME, request.GET['zoom'], request.GET['lat'], request.GET['lon'], request.GET['layer_name'])
   url = "/blueearth/basic_map/%s/%s/%s/%s" % (request.GET['zoom'], request.GET['lat'], request.GET['lon'], request.GET['layer'])
   url = urllib.urlopen('http://tinyurl.com/api-create.php?url=' + url).read()
   resp = '%s' % (url)
   return HttpResponse(resp, mimetype="application/text")

def export_to_shapefile(request):
   """
   Handles exporting user generated points to a shape file and allowing the user to
   download the shape file.  Output shape files are stored in the /static/temp + current time stamp
   folder.  The assumption is if there are multiple users hitting the site no two will generate a
   shapefile at exactly the same time.
   """

   points = request.GET['points']
   outfn = 'gpspoints'
   time_stamp = str(time.time())
   outdir = settings.PROJECT_PATH + '/static/temp/' + time_stamp + "/"
   make_shapefile(points, outdir, outfn)
   zip_shapefile(outfn, outdir)
   resp = '%s' % (time_stamp + '/' + outfn + '.zip')
   return HttpResponse(resp, mimetype='application/text')

def login(request):
   """
   Handles login requests
   """
   uid = request.POST['uid']
   pwd = request.POST['pwd']

   user = authenticate(username=uid, password=pwd)
   if user is not None:
      if user.is_active:
         djlogin(request, user)
         return HttpResponseRedirect("/blueearth")
      else:
         message = 'Sorry! Invalid login.'
         return render_to_response('login.html', {'media_url':settings.MEDIA_URL, 'message':message})
   else:
      message = 'Sorry! Invalid login.'
      return render_to_response('login.html', {'media_url':settings.MEDIA_URL, 'message':message})
#   authenticator = Authenticator()
#   person = authenticator.authenticate(request)
#
#   if person:
#      if person.locked:
#         return render_to_response('disabled.html')
#      else:
#         request.session['user'] = person
#         return HttpResponseRedirect("/blueearth")
#   else:
#      message = 'Sorry! Invalid login.'
#      return render_to_response('login.html', {'media_url':settings.MEDIA_URL, 'message':message})

def logout(request):
   """
   Handles logout requests.  Can add usage tracking functionality here.
   """
   djlogout(request)
   #if 'user' in request.session:
   #   del request.session['user']
   return HttpResponseRedirect('/blueearth')

def password_reset(request):
   """ Handles a user request to reset a password """

   # Error messages
   message = None

   if 'fname' in request.POST and 'lname' in request.POST and 'uid' in request.POST and 'new_pwd' in request.POST:
      fname = request.POST['fname']
      lname = request.POST['lname']
      uid = request.POST['uid']
      new_pwd = request.POST['new_pwd']

      if len(fname) == 0:
         message = 'User first name required!'
      elif len(lname) == 0:
         message = 'User last name required!'
      elif len(uid) == 0:
         message = 'User ID required!'
      elif len(new_pwd) == 0:
         message = 'New password required!'
      else:
         try:
            person = Person.objects.get(first_name=fname, last_name=lname, username=uid)
            person.password = new_pwd
            person.save()
            message = 'Password reset successfull.'
            return render_to_response('login.html', {'media_url':settings.MEDIA_URL, 'message':message})
         except ObjectDoesNotExist:
            message = 'User not found.'

   return render_to_response('password_reset.html', {'media_url':settings.MEDIA_URL, 'message':message})

def make_shapefile(points, outdir, outfn):
   """
   Helper function
   TODO: Put this in utils.py
   """

   # Check to make sure output dir exists and create if needed
   if not os.path.exists(outdir):
      os.makedirs(outdir)
   ofile = outdir + outfn + '.shp'
   driver = ogr.GetDriverByName('ESRI Shapefile')
   out_data_source = driver.CreateDataSource(ofile)
   field_def = ogr.FieldDefn("id", ogr.OFTString)
   field_def.SetWidth(10)
   srs = None
   outLayer = out_data_source.CreateLayer('gpspoints', srs, geom_type=ogr.wkbPoint)
   outLayer.CreateField (field_def)

   for p in points.split('|'):
      pt = p.split(',')
      id = pt[0]
      lat = float(pt[2])
      lon = float(pt[1])
      pt = ogr.Geometry(ogr.wkbPoint)
      pt.SetPoint_2D(0, lon, lat)
      feature = ogr.Feature(outLayer.GetLayerDefn())
      feature.SetGeometry(pt)
      feature.SetField("id", id)
      outLayer.CreateFeature(feature)
      feature.Destroy()

   out_data_source.Destroy()

def zip_shapefile(fname, out_dir):
   """
   Helper function
   TODO: Put this in utils.py
   """
   # Change current dir to output dir
   os.chdir(out_dir)
   archive_list = os.listdir(out_dir)
   zfilename = out_dir + fname + '.zip'
   zout = zipfile.ZipFile(zfilename, "w")
   for fname in archive_list:
      zout.write(fname)
   zout.close()

def custom_404(request):
   message = None
   return render_to_response('404.html', {'media_url':settings.MEDIA_URL, 'message':message})

def custom_500(request):
   message = None
   return render_to_response('404.html', {'media_url':settings.MEDIA_URL, 'message':message})
