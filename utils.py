import osgeo, os, zipfile, hashlib
#from blueearthapp.models import Person
from django.core.exceptions import ObjectDoesNotExist

def make_shapefile(points, outdir, outfn):
   """
   Helper function
   TODO: Put this in utils.py
   """
   # Check to make sure output dir exists and create if needed
   if not os.path.exists(outdir):
      os.makedirs(outdir)
   ofile = outdir + outfn + '.shp'
   driver = osgeo.ogr.GetDriverByName('ESRI Shapefile')
   out_data_source = driver.CreateDataSource(ofile)
   field_def = osgeo.ogr.FieldDefn("id", osgeo.ogr.OFTString)
   field_def.SetWidth(10)
   #srs = osgeo.osr.SpatialReference()
   #srs.SetWellKnownGeogCS("UTM");
   #srs.SetUTM(11);
   srs = None
   outLayer = out_data_source.CreateLayer('gpspoints', srs, geom_type=osgeo.ogr.wkbPoint)
   outLayer.CreateField (field_def)

   for p in points.split('|'):
      pt = p.split(',')
      id = pt[0]
      lat = float(pt[2])
      lon = float(pt[1])
      pt = osgeo.ogr.Geometry(osgeo.ogr.wkbPoint)
      #utmpt = latlon2utm(lon, lat, 11)
      #x = utmpt[0]
      #y = utmpt[1]
      pt.SetPoint_2D(0, lon, lat)
      #pt.SetPoint_2D(0, x, y)
      feature = osgeo.ogr.Feature(outLayer.GetLayerDefn())
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

class Authenticator():
   """ Helper classed used to authenticate front-end users """
   def __init__(self):
      pass

   def authenticate(self, request):
      """ Authenticates a user.  Expects a url request. Using sha1 to verify the password."""
      pass
#      uid = request.POST['uid']
#      passwd = request.POST['pwd']
#      s = hashlib.sha1()
#      s.update(passwd)
#      s.digest()
#      try:
#         #person = Person.objects.get(username=uid, password=passwd)
#         person = Person.objects.get(username=uid, password=s.hexdigest())
#         return person
#      except ObjectDoesNotExist:
#         return False
#      return False


