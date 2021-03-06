from django.db import models
import re
from django.contrib.auth.models import User, UserManager

class CropType(models.Model):
   """ Crop type object """

   # The crop type name
   name = models.CharField(max_length=25)

   def __str__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Crop Types"
      db_table = "croptypes"

class ImageType(models.Model):
   """ Image type object """

   # The image type name
   name = models.CharField(max_length=25)

   # The file extension for the image type
   extension = models.CharField(max_length=25)

   def __unicode__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Image Types"
      db_table = "imagetypes"

class AirCraft(models.Model):
   """ Aircraft object """

   # the aircraft name
   name = models.CharField(max_length=100)

   def __unicode__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Aircraft"
      db_table = "aircraft"

class Camera(models.Model):
   """ Camera object """

   # the camera name
   name = models.CharField(max_length=100)

   def __str__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Cameras"
      db_table = "cameras"

class Server(models.Model):
   """ Server object """

   # the server name
   name = models.CharField(max_length=100)

   def __str__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Servers"
      db_table = "servers"

class Organization(models.Model):
   """
   An organization is a model that represents a company or group that is a customer.
   There can be different types of organizations.  This model currently allows includes
   an 'Agency' type and a 'Customer' type.

   An agency type is an organization that manages a property or properties for a 'Customer'.
   A 'Customer' is a company or entity that owns and manages one or more properties.
   """

   # An organization has many users
   #users = models.ManyToOneField(User)
   members = models.ManyToManyField(User, through='Membership')
   #user = models.OneToOneField(User, null=True, blank=True)
   #user = models.ForeignKey(User, null=True, blank=True)

   # The organization name
   name = models.CharField(max_length=100)

   # The organization type.  To add a nother type create another tuple in TYPE_CHOICES
   TYPE_CHOICES = ((0, 'Agency'), (1,'Customer'))
   type = models.IntegerField(max_length=1, choices=TYPE_CHOICES)

   # Organization's street address
   address = models.CharField(max_length=150, null=True, blank=True)

   # Organization's street city
   city = models.CharField(max_length=100, null=True, blank=True)

   # Organization's state
   state = models.CharField(max_length=2, null=True, blank=True)

   # Organization's zipcode
   zipcode = models.CharField(max_length=11, null=True, blank=True)

   # Date organization record was created
   created_on = models.DateField(auto_now=True, auto_now_add=True)

   # Organization account is locked or not
   locked = models.NullBooleanField(default=False)

   # Organization phone number
   phone = models.CharField(max_length=12, null=True, blank=True)

   # Organization fax number
   fax = models.CharField(max_length=12, null=True, blank=True)

   def __unicode__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Organizations (Agencies, Owners, ...)"
      db_table = "organizations"

class Membership(models.Model):
   user = models.ForeignKey(User)
   organization = models.ForeignKey(Organization)

   def __unicode__(self):
      return '%s' % (self.organization.name)

   class Meta:
      verbose_name_plural = "Organization (Customer, Agency)"
      db_table = "memberships"

class Property(models.Model):
   """ Property object
   TODO: implement limit_choices_to on customer, agency, and agent fields
   """

   # A customer has many fields
   #customer = models.ForeignKey(Person, related_name='customer_relate', null=True, blank=True)
   customer = models.ForeignKey(Organization)

   #agency = models.ForeignKey(Organization, related_name='agency_relate', null=True, blank=True)
   # Every property can be managed by a 0 to many angencies.  Has to be a many-to-many relationship
   # in order to prevent the deletion of the property when an agency is deleted.
   #agency = models.ManyToManyField(Organization, related_name='agency_relate', null=True, blank=True)
   #agency = models.OneToOneField(Organization, related_name='agency_relate', null=True, blank=True, default=0)

   # A property could have many agents
   #agent = models.ForeignKey(Person, related_name='agent_relate', null=True, blank=True)
   #agent = models.ForeignKey(User, null=True, blank=True)
   # A property can have 0 or many agents.  Has to be a many-to-many relationship to prevent the
   # deletion of a property when a user who is the agent is deleted.
   agent = models.ManyToManyField(User, null=True, blank=True)

   # The property name
   name = models.CharField(max_length=100)

   # The property number could be number or character or combo
   field_number = models.CharField(max_length=25, null=True, blank=True)

   # center latitude
   center_lat = models.FloatField(null=True, blank=True)

   # center longitude
   center_lon = models.FloatField(null=True, blank=True)

   # center elevation
   center_elev = models.FloatField(null=True, blank=True)

   # starupt zoom level
   zoom = models.IntegerField(max_length=2, null=True, blank=True)

   # resolution image was captured at
   resolution = models.IntegerField(max_length=10, null=True, blank=True)

   # the surface area of the property
   area = models.FloatField(null=True, blank=True)

   # the property's current croptype
   #croptype = models.OneToOneField(CropType, null=True, blank=True)
   croptype = models.ForeignKey(CropType, null=True, blank=True)

   # Property is locked or not
   locked = models.NullBooleanField(default=False, null=True, blank=True)

   # Date property record was created
   created_on = models.DateField(auto_now=True, auto_now_add=True)

   def __unicode__(self):
      return '%s' % (self.name)

   class Meta:
      verbose_name_plural = "Properties (Fields)"
      db_table = "properties"

class Image(models.Model):
   """ Image object """

   # A property has many images but each image belongs to one property
   property = models.ForeignKey(Property)

   # the image types that the property currently has
   imagetype = models.ForeignKey(ImageType, null=True, blank=True)

   # the date the image was taken
   capture_date = models.DateField(null=True, blank=True)

   # the name of the layer.  used by wms
   webserver_layer = models.CharField(max_length=200, null=True, blank=True)

   # the crop type when the image was taken
   #croptype = models.OneToOneField(CropType, null=True, blank=True)
   croptype = models.ForeignKey(CropType, null=True, blank=True)

   # flight time
   flight_time = models.TimeField(null=True, blank=True)

   # iamge resolution
   resolution = models.IntegerField(max_length=10, null=True, blank=True)

   # aircraft used to capture the image
   #aircraft = models.OneToOneField(AirCraft, null=True, blank=True)
   aircraft = models.ForeignKey(AirCraft, null=True, blank=True)

   # camera used to capture the image
   #camera = models.OneToOneField(Camera, null=True, blank=True)
   camera = models.ForeignKey(Camera, null=True, blank=True)

   # image processing version
   image_processing_version = models.CharField(max_length=50, null=True, blank=True)

   # date image was published
   published_date = models.DateField(null=True, blank=True)

   # server being used to display the image
   #server = models.OneToOneField(Server, null=True, blank=True)
   server = models.ForeignKey(Server, null=True, blank=True)

   # description of the image
   description = models.TextField(null=True, blank=True)

   # flag for enabling image display
   locked = models.NullBooleanField(default=False, null=True, blank=True)

   def __str__(self):
      return '%s' % (self.webserver_layer)

   class Meta:
      verbose_name_plural = "Images"
      db_table = "images"

class UserProfile(models.Model):
   """ A user's profile """

   #user = models.ForeignKey(User, unique=True)
   user = models.OneToOneField(User)

   # person's address
   address = models.CharField(max_length=100, null=True, blank=True)

   # person's street city
   city = models.CharField(max_length=100, null=True, blank=True)

   # Agency's state
   state = models.CharField(max_length=2, null=True, blank=True)

   # person's zipcode
   zipcode = models.CharField(max_length=11, null=True, blank=True)

   # person phone number
   phone = models.CharField(max_length=12, null=True, blank=True)

   # person fax number
   fax = models.CharField(max_length=12, null=True, blank=True)

   # Person's email address
   email = models.CharField(max_length=200, null=True, blank=True)

   # Date person record was created
   created_on = models.DateField(auto_now=True, auto_now_add=True)

   # person account is locked or not
   locked = models.NullBooleanField(default=False)

   def __unicode__(self):
      return self.user.username

   class Meta:
      verbose_name_plural = "Profile"
      db_table = "user_profiles"
