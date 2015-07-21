"""
This file demonstrates two different styles of tests (one doctest and one
unittest). These will both pass when you run "manage.py test".

Replace these with more appropriate tests for your application.

TODO: Possible test for created_on dates
"""
from django.test import TestCase
from django.contrib.auth.models import User
from blueearth.blueearthapp.models import Image
from blueearth.blueearthapp.models import Property
from blueearth.blueearthapp.models import CropType

class BasicTestCase(TestCase):
   fixtures = ['users.yaml']

   def test_index(self):
      """
      Test a request to the index page
      """
      response = self.client.post('/blueearth/')
      self.assertNotEquals(response, None)
      self.failUnlessEqual(response.status_code, 200)
      self.assertContains(response, 'Blue Earth Imaging - Login')

   def test_users(self):
      users = User.objects.all()
      self.assertTrue(len(users) > 0, 'User count test failed.')

class CustomerTestCase(TestCase):
   """
   Tests a customer user type logging in and using the application.
   """
   fixtures = ['users.yaml', 'properties.yaml', 'organizations.yaml', 'memberships.yaml', 'images.yaml', 'croptypes.yaml']

   def setUp(self):
      self.username = 'akalin'
      self.password = 'password'

   def test_login(self):
      response = self.client.post('/blueearth/login/', {'uid':self.username, 'pwd':self.password})
      # Check that the response is 302 OK, redirect to main page.
      self.failUnlessEqual(response.status_code, 302, 'Customer login failed.')

   def test_get_properties(self):
      user = User.objects.get(username=self.username)
      result = self.client.login(username=self.username, password=self.password)
      self.assertTrue(result, 'Customer not able to login.')
      response = self.client.get('/blueearth/')
      self.assertContains(response, 'properties')
      self.assertContains(response, 'Kalin BN1, BN2')
      self.assertContains(response, 'Kalin Fuller')
      self.assertContains(response, 'Kalin Trif 9')

   def test_get_dates(self):
      user = User.objects.get(username=self.username)
      self.client.login(username=self.username, password=self.password)
      org = user.organization_set.all()[0]
      self.assertTrue(org <> None)

      # TODO: Change the array index to a random number
      propid = org.property_set.all()[0].id
      result = self.client.get('/blueearth/get_property_image_dates/', {'propid':propid})
      self.assertContains(result, 'lat')
      self.assertContains(result, 'lon')

   def test_get_image(self):
      self.fail()

class ImageTestCase(TestCase):
   fixtures = ['users.yaml', 'properties.yaml', 'organizations.yaml', 'memberships.yaml', 'images.yaml', 'croptypes.yaml']

   def test_create_image(self):
      property = Property.objects.get(pk=1)
      croptype = CropType.objects.get(pk=2)
      image = Image()
      image.property = property
      image.croptype = croptype
      image.save()
      self.assertNotEqual(image.id, None, 'Error trying to save new image.')

class RuckerImageTest(TestCase):
   fixtures = ['users.yaml', 'properties.yaml', 'organizations.yaml', 'memberships.yaml', 'images.yaml', 'croptypes.yaml']

   def test_add_image(self):
      user = User.objects.get(pk=12)
      image = Image()

      self.assertEquals(user.username, 'brucker')

#from django.http import HttpRequest
##from django.test.client import Client
#from utils import Authenticator
#from blueearthapp.models import Person
#from blueearthapp.models import Property
#
#class PersonTestCase(TestCase):
#   """ A simple test on the Person entity """
#   fixtures = ['persons.yaml']
#
#   def setUp(self):
#      """ Test setup steps """
#      self.username = 'test'
#      self.password = 'password'
#      self.person = Person(username=self.username, password=self.password)
#      self.person.save()
#
#   def test_person(self):
#      """ See if the user can be found """
#      user = Person.objects.get(username=self.username)
#      self.assertNotEqual(user, None)
#
#class LoginTestCase(TestCase):
#   """ Test the login page and the authenticator """
#   fixtures = ['persons.yaml']
#
#   def setUp(self):
#      self.username = 'Helena'
#      self.password = 'password'
#
#   def test_login(self):
#      """ Calling the login should generate a 302 which is a redirect to the main page """
#      response = self.client.post('/blueearth/login/', {'uid':self.username, 'pwd':self.password})
#      # Check that the response is 302 OK, redirect to main page.
#      self.failUnlessEqual(response.status_code, 302)

#class AuthenticatorTest(TestCase):
#   """ Tests the user/person authentification """
#
#   def test_authenticate(self):
#      """ Test person/user authentication """
#      authenticator = Authenticator()
#      request = HttpRequest()
#      request.POST = {'uid':'Helena', 'pwd':'password'}
#      self.assertNotEqual(request, None, 'Request test failed.')
#      person = authenticator.authenticate(request)
#      self.assertNotEqual(person, False, 'Person test failed.')
#
#class UserTest(TestCase):
#
#   def test_user_type(self):
#      # Get and test the Helena user
#      user = Person.objects.get(id=2)
#      self.assertNotEqual(user, None)
#
#      # Get and test the Helena user's properties
#      properties = Property.objects.filter(user = user.id)
#      self.assertTrue(len(properties) > 0)
#      for p in properties:
#         self.assertTrue(p <> None)
#
#         # Get the current property's images and test
#         images = p.image_set.all()
#         self.assertTrue(images <> None)
#         for i in images:
#            self.assertTrue(i <> None)
#            self.assertTrue(i.capture_date <> None)

#from datetime import date
#from django.test import TestCase
#from django.http import HttpResponse, HttpResponseRedirect, HttpRequest
#
#from blueearthapp.models import *
#from utils import Authenticator
#
#class AuthenticatorTest(TestCase):
#   """ Tests the user/person authentification """
#
#   def test_authenticate(self):
#      """ Test person/user authentication """
#      authenticator = Authenticator()
#      request = HttpRequest()
#      request.POST = {'uid':'hguest', 'pwd':'password'}
#      self.assertNotEqual(request, None, 'Request test failed.')
#      person = authenticator.authenticate(request)
#      self.assertNotEqual(person, False, 'Person test failed.')
#
#class UsersTest(TestCase):
#   """ Tests for the different user types """
#
#   def test_user(self):
#      """ A User only gets to see his own properties """
#      user = Person.objects.get(username='huser')
#      self.assertNotEqual(user, None)
#
#      properties = Property.objects.filter(user=user.id)
#      self.assertNotEqual(properties, None)
#      self.assertTrue(len(properties) > 0, 'Property count for test user failed.')
#
#   def test_customer(self):
#      """ A Customer only gets to see his own properties """
#      customer = Person.objects.get(username='tcustomer')
#      self.assertNotEqual(customer, None, 'Failed trying to find test customer.')
#
#      # Test to see if the customer has the right number of properties
#      properties = Property.objects.filter(customer=customer.id)
#      self.assertNotEqual(properties, None, 'Failed trying to retrieve test customer properties.')
#      self.assertTrue(len(properties) == 1, 'Property count for test customer failed.')
#
#   def test_agent(self):
#      """
#      An agent can be tested for existence then the
#      number of user's and those user's properties list
#      """
#      agent = Person.objects.get(username='hagent')
#      self.assertNotEqual(agent, None, 'Agent user failed.  Agent not found.')
#
#      agency = Agency.objects.get(id=agent.agency.id)
#      self.assertNotEqual(agency, None, "Failed trying to find agent's agency.")
#
#      users = agency.person_set.all()
#      self.assertNotEqual(users, None, "Failed trying to find agent's users")
#      self.assertTrue(len(users) > 0, "Failed on agent's user count.")
#
#      if len(users) > 0:
#         for u in users:
#            self.assertNotEqual(u, None, "Failed testing one of an agent's users")
#            properties = Property.objects.filter(user=u.id)
#            self.assertNotEqual(properties, None, "Failed tyring to find an agent's user's properties.")
#            self.assertTrue(len(properties) >= 0, "Failed tyring to find an agent's user's property list count.")
