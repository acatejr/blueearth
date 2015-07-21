from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserChangeForm
from django import forms

from blueearth.blueearthapp.models import CropType
from blueearth.blueearthapp.models import ImageType
from blueearth.blueearthapp.models import Server
from blueearth.blueearthapp.models import Property
from blueearth.blueearthapp.models import Image
from blueearth.blueearthapp.models import Camera
from blueearth.blueearthapp.models import AirCraft
from blueearth.blueearthapp.models import Organization
from blueearth.blueearthapp.models import Membership
from blueearth.blueearthapp.models import UserProfile

admin.site.unregister(User)      
class UserProfileInline(admin.TabularInline):
   model = UserProfile
   max_num = 1   
class MembersInline(admin.TabularInline):
   model = Membership
   max_num = 1
class UserAdmin(UserAdmin):
   list_display = ('id', 'first_name', 'last_name', 'username', 'organization')
   list_filter = ('is_staff', 'is_superuser')
   ordering = ['id']
   inlines = [UserProfileInline, MembersInline,]
   save_on_top = True
   
   def organization(self, obj):
      try:
         return obj.organization_set.all()[0]
      except IndexError:
         return ''
   organization.short_description = 'Organization (Agency, Customer)'
admin.site.register(User, UserAdmin)

class PropertyForm(forms.ModelForm):
   def __init__(self, *args, **kwargs):
      super(PropertyForm, self).__init__(*args, **kwargs)

      # Filter the agency selection
      #agency = self.fields['agency']
      #choices = []
      #for choice in Organization.objects.filter(type=0).order_by('name'):
      #   choices.append((choice.id, choice.name))
      #agency.choices = choices

      # Filter the customers selection
      customer = self.fields['customer']
      choices = []
      for choice in Organization.objects.filter(type=1).order_by('name'):
         choices.append((choice.id, choice.name))
      customer.choices = choices

      # Show only "regular" users on property form
      agent = self.fields['agent']
      choices = []
      for user in User.objects.all().order_by('username'):
         if not user.is_superuser:
            choices.append((user.id, user.username))
      agent.choices = choices

class ImageInline(admin.TabularInline):
   """ Setup inline image editing """
   model = Image
   max_num = 10
class PropertyAdmin(admin.ModelAdmin):
   """
   Property Admin  - setup the interface for property admin
   2/24/2010 10:04:07 AM - disabled the ImageInLine as per request by KDK
   """
   list_display = ('id', 'name', 'customer','center_lat', 'center_lon', 'zoom')
   #list_filter = ['customer','agency','agent']
   list_filter = ['customer','agent']
   #inlines = [ImageInline,]
   ordering = ['id']
   save_on_top = True
   form = PropertyForm

#   def formfield_for_foreignkey(self, db_field, request, **kwargs):
#      print db_field.name
#      if db_field.name == "agency":
#         kwargs["queryset"] = Organization.objects.filter(type==0)
#         return db_field.formfield(**kwargs)
#      return super(PropertyAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
admin.site.register(Property, PropertyAdmin)

class OrganizationAdmin(admin.ModelAdmin):
   list_display = ('id', 'name', 'type', 'city', 'state', 'zipcode')
   list_filter = ['type']
   ordering = ['id']
   save_on_top = True
   #inlines = [MembersInline,]
   # formfield_for_foreignkey -- look this up to filter agents and users
admin.site.register(Organization, OrganizationAdmin)

class ImageTypeAdmin(admin.ModelAdmin):
   list_display = ('id', 'name', 'extension')
   ordering = ['id']
admin.site.register(ImageType, ImageTypeAdmin)

class CropTypeAdmin(admin.ModelAdmin):
   list_display = ('id', 'name')
   ordering = ['id']
admin.site.register(CropType, CropTypeAdmin)

class ServerAdmin(admin.ModelAdmin):
   list_display= ('id', 'name')
   ordering = ['id']
admin.site.register(Server, ServerAdmin)

class CameraAdmin(admin.ModelAdmin):
   list_display = ('id', 'name')
   ordering = ['id']
admin.site.register(Camera, CameraAdmin)

class AirCraftAdmin(admin.ModelAdmin):
   list_display = ('id', 'name')
   ordering = ['id']
admin.site.register(AirCraft, AirCraftAdmin)

class ImageAdmin(admin.ModelAdmin):
   list_display = ('id', 'webserver_layer', 'property', 'imagetype', 'capture_date')
   ordering = ['id']
   list_filter = ['capture_date', 'property']
   save_on_top = True
admin.site.register(Image, ImageAdmin)

#admin.site.register(Person)
#admin.site.register(Agency)
#admin.site.register(Image)
#admin.site.register(Property)
#admin.site.register(Organization)
#admin.site.register(UserProfile)
#admin.site.register(Server)
#admin.site.register(ImageType)
#admin.site.register(CropType)
#admin.site.register(PersonType)
#admin.site.register(Camera)
#admin.site.register(AirCraft)
