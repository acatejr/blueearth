from django.conf.urls.defaults import *
from django.conf import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
   # Example:
   # (r'^blueearth/', include('blueearth.foo.urls')),

   # Uncomment the admin/doc line below and add 'django.contrib.admindocs'
   # to INSTALLED_APPS to enable admin documentation:
   # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

   # Uncomment the next line to enable the admin:
   (r'^admin/', include(admin.site.urls)),
   (r'^blueearth/admin/', include(admin.site.urls)),

   (r'^$', 'blueearthapp.views.index'),
   (r'^blueearth/$', 'blueearthapp.views.index'),
   (r'^mobile/$', 'blueearthapp.views.mobile'),
   (r'^blueearth/mobile/$', 'blueearthapp.views.mobile'),
   (r'^mobile_login/$', 'blueearthapp.views.mobile_login'),
   (r'^blueearth/mobile_login/$', 'blueearthapp.views.mobile_login'),
   (r'^login/$', 'blueearthapp.views.login'),
   (r'^blueearth/login/$', 'blueearthapp.views.login'),
   (r'^logout/$', 'blueearthapp.views.logout'),
   (r'^blueearth/logout/$', 'blueearthapp.views.logout'),
   (r'^get_property_image_dates/$', 'blueearthapp.views.get_property_image_dates'),
   (r'^blueearth/get_property_image_dates/$', 'blueearthapp.views.get_property_image_dates'),
   (r'^get_image_types/$', 'blueearthapp.views.get_image_types'),
   (r'^blueearth/get_image_types/$', 'blueearthapp.views.get_image_types'),
   (r'^get_image/$', 'blueearthapp.views.get_image'),
   (r'^blueearth/get_image/$', 'blueearthapp.views.get_image'),
   (r'^get_elevation/$', 'blueearthapp.views.get_elevation'),
   (r'^blueearth/get_elevation/$', 'blueearthapp.views.get_elevation'),
   (r'^export_to_shapefile/$', 'blueearthapp.views.export_to_shapefile'),
   (r'^blueearth/export_to_shapefile/$', 'blueearthapp.views.export_to_shapefile'),
   (r'^get_map_link/$', 'blueearthapp.views.get_map_link'),
   (r'^blueearth/get_map_link/$', 'blueearthapp.views.get_map_link'),
   (r'^mobile/showmap/', 'blueearthapp.views.mobile_showmap'),
   (r'^blueearth/mobile/showmap/', 'blueearthapp.views.mobile_showmap'),
   (r'^mobile/logout/$', 'blueearthapp.views.mobile_logout'),
   (r'^blueearth/mobile/logout/$', 'blueearthapp.views.mobile_logout'),
   (r'^get_agents/$', 'blueearthapp.views.get_agents'),
   (r'^blueearth/get_agents/$', 'blueearthapp.views.get_agents'),
   (r'^get_properties/$', 'blueearthapp.views.get_properties'),
   (r'^blueearth/get_properties/$', 'blueearthapp.views.get_properties'),
   (r'^blueearth/password_reset/$', 'blueearthapp.views.password_reset'),

   #(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_DOC_ROOT, 'show_indexes': True}),

)

handler404 = 'blueearthapp.views.custom_404'
handler500 = 'blueearthapp.views.custom_500'

