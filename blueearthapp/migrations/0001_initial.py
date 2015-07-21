
from south.db import db
from django.db import models
from blueearth.blueearthapp.models import *

class Migration:
    
    def forwards(self, orm):
        
        # Adding model 'CropType'
        db.create_table('croptypes', (
            ('id', orm['blueearthapp.CropType:id']),
            ('name', orm['blueearthapp.CropType:name']),
        ))
        db.send_create_signal('blueearthapp', ['CropType'])
        
        # Adding model 'Agency'
        db.create_table('agencies', (
            ('id', orm['blueearthapp.Agency:id']),
            ('name', orm['blueearthapp.Agency:name']),
            ('address', orm['blueearthapp.Agency:address']),
            ('city', orm['blueearthapp.Agency:city']),
            ('state', orm['blueearthapp.Agency:state']),
            ('zipcode', orm['blueearthapp.Agency:zipcode']),
            ('created_on', orm['blueearthapp.Agency:created_on']),
            ('locked', orm['blueearthapp.Agency:locked']),
            ('phone', orm['blueearthapp.Agency:phone']),
            ('fax', orm['blueearthapp.Agency:fax']),
        ))
        db.send_create_signal('blueearthapp', ['Agency'])
        
        # Adding model 'Image'
        db.create_table('images', (
            ('id', orm['blueearthapp.Image:id']),
            ('property', orm['blueearthapp.Image:property']),
            ('imagetypes', orm['blueearthapp.Image:imagetypes']),
            ('capture_date', orm['blueearthapp.Image:capture_date']),
            ('webserver_layer', orm['blueearthapp.Image:webserver_layer']),
            ('croptype', orm['blueearthapp.Image:croptype']),
            ('flight_time', orm['blueearthapp.Image:flight_time']),
            ('resolution', orm['blueearthapp.Image:resolution']),
            ('aircraft', orm['blueearthapp.Image:aircraft']),
            ('camera', orm['blueearthapp.Image:camera']),
            ('image_processing_version', orm['blueearthapp.Image:image_processing_version']),
            ('published_date', orm['blueearthapp.Image:published_date']),
            ('server', orm['blueearthapp.Image:server']),
            ('description', orm['blueearthapp.Image:description']),
            ('locked', orm['blueearthapp.Image:locked']),
        ))
        db.send_create_signal('blueearthapp', ['Image'])
        
        # Adding model 'ImageType'
        db.create_table('imagetypes', (
            ('id', orm['blueearthapp.ImageType:id']),
            ('name', orm['blueearthapp.ImageType:name']),
            ('extension', orm['blueearthapp.ImageType:extension']),
        ))
        db.send_create_signal('blueearthapp', ['ImageType'])
        
        # Adding model 'Property'
        db.create_table('properties', (
            ('id', orm['blueearthapp.Property:id']),
            ('customer', orm['blueearthapp.Property:customer']),
            ('agency', orm['blueearthapp.Property:agency']),
            ('agent', orm['blueearthapp.Property:agent']),
            ('name', orm['blueearthapp.Property:name']),
            ('field_number', orm['blueearthapp.Property:field_number']),
            ('center_lat', orm['blueearthapp.Property:center_lat']),
            ('center_lon', orm['blueearthapp.Property:center_lon']),
            ('center_elev', orm['blueearthapp.Property:center_elev']),
            ('zoom', orm['blueearthapp.Property:zoom']),
            ('resolution', orm['blueearthapp.Property:resolution']),
            ('area', orm['blueearthapp.Property:area']),
            ('croptype', orm['blueearthapp.Property:croptype']),
            ('locked', orm['blueearthapp.Property:locked']),
            ('created_on', orm['blueearthapp.Property:created_on']),
        ))
        db.send_create_signal('blueearthapp', ['Property'])
        
        # Adding model 'Organization'
        db.create_table('blueearthapp_organization', (
            ('id', orm['blueearthapp.Organization:id']),
            ('name', orm['blueearthapp.Organization:name']),
            ('type', orm['blueearthapp.Organization:type']),
        ))
        db.send_create_signal('blueearthapp', ['Organization'])
        
        # Adding model 'UserProfile'
        db.create_table('user_profiles', (
            ('id', orm['blueearthapp.UserProfile:id']),
            ('user', orm['blueearthapp.UserProfile:user']),
            ('address', orm['blueearthapp.UserProfile:address']),
            ('city', orm['blueearthapp.UserProfile:city']),
            ('state', orm['blueearthapp.UserProfile:state']),
            ('zipcode', orm['blueearthapp.UserProfile:zipcode']),
            ('phone', orm['blueearthapp.UserProfile:phone']),
            ('fax', orm['blueearthapp.UserProfile:fax']),
            ('email', orm['blueearthapp.UserProfile:email']),
            ('created_on', orm['blueearthapp.UserProfile:created_on']),
            ('locked', orm['blueearthapp.UserProfile:locked']),
        ))
        db.send_create_signal('blueearthapp', ['UserProfile'])
        
        # Adding model 'Server'
        db.create_table('servers', (
            ('id', orm['blueearthapp.Server:id']),
            ('name', orm['blueearthapp.Server:name']),
        ))
        db.send_create_signal('blueearthapp', ['Server'])
        
        # Adding model 'PersonType'
        db.create_table('person_types', (
            ('id', orm['blueearthapp.PersonType:id']),
            ('name', orm['blueearthapp.PersonType:name']),
        ))
        db.send_create_signal('blueearthapp', ['PersonType'])
        
        # Adding model 'AirCraft'
        db.create_table('aircraft', (
            ('id', orm['blueearthapp.AirCraft:id']),
            ('name', orm['blueearthapp.AirCraft:name']),
        ))
        db.send_create_signal('blueearthapp', ['AirCraft'])
        
        # Adding model 'Camera'
        db.create_table('cameras', (
            ('id', orm['blueearthapp.Camera:id']),
            ('name', orm['blueearthapp.Camera:name']),
        ))
        db.send_create_signal('blueearthapp', ['Camera'])
        
    
    
    def backwards(self, orm):
        
        # Deleting model 'CropType'
        db.delete_table('croptypes')
        
        # Deleting model 'Agency'
        db.delete_table('agencies')
        
        # Deleting model 'Image'
        db.delete_table('images')
        
        # Deleting model 'ImageType'
        db.delete_table('imagetypes')
        
        # Deleting model 'Property'
        db.delete_table('properties')
        
        # Deleting model 'Organization'
        db.delete_table('blueearthapp_organization')
        
        # Deleting model 'UserProfile'
        db.delete_table('user_profiles')
        
        # Deleting model 'Server'
        db.delete_table('servers')
        
        # Deleting model 'PersonType'
        db.delete_table('person_types')
        
        # Deleting model 'AirCraft'
        db.delete_table('aircraft')
        
        # Deleting model 'Camera'
        db.delete_table('cameras')
        
    
    
    models = {
        'auth.group': {
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'unique_together': "(('content_type', 'codename'),)"},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True', 'blank': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'blueearthapp.agency': {
            'Meta': {'db_table': "'agencies'"},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '150', 'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'created_on': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'fax': ('django.db.models.fields.CharField', [], {'max_length': '12', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'locked': ('django.db.models.fields.NullBooleanField', [], {'default': 'False', 'null': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '12', 'null': 'True', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'zipcode': ('django.db.models.fields.CharField', [], {'max_length': '11', 'null': 'True', 'blank': 'True'})
        },
        'blueearthapp.aircraft': {
            'Meta': {'db_table': "'aircraft'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'blueearthapp.camera': {
            'Meta': {'db_table': "'cameras'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'blueearthapp.croptype': {
            'Meta': {'db_table': "'croptypes'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'})
        },
        'blueearthapp.image': {
            'Meta': {'db_table': "'images'"},
            'aircraft': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['blueearthapp.AirCraft']", 'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'camera': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['blueearthapp.Camera']", 'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'capture_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'croptype': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['blueearthapp.CropType']", 'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'flight_time': ('django.db.models.fields.TimeField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image_processing_version': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'imagetypes': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['blueearthapp.ImageType']", 'null': 'True', 'blank': 'True'}),
            'locked': ('django.db.models.fields.NullBooleanField', [], {'default': 'False', 'null': 'True', 'blank': 'True'}),
            'property': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['blueearthapp.Property']"}),
            'published_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'resolution': ('django.db.models.fields.IntegerField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'}),
            'server': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['blueearthapp.Server']", 'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'webserver_layer': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'})
        },
        'blueearthapp.imagetype': {
            'Meta': {'db_table': "'imagetypes'"},
            'extension': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'})
        },
        'blueearthapp.organization': {
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.IntegerField', [], {'max_length': '1'})
        },
        'blueearthapp.persontype': {
            'Meta': {'db_table': "'person_types'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15', 'null': 'True', 'blank': 'True'})
        },
        'blueearthapp.property': {
            'Meta': {'db_table': "'properties'"},
            'agency': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'agency_relate'", 'to': "orm['blueearthapp.Organization']"}),
            'agent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'area': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'center_elev': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'center_lat': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'center_lon': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'created_on': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'auto_now_add': 'True', 'blank': 'True'}),
            'croptype': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['blueearthapp.CropType']", 'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'customer': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['blueearthapp.Organization']"}),
            'field_number': ('django.db.models.fields.CharField', [], {'max_length': '25', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'locked': ('django.db.models.fields.NullBooleanField', [], {'default': 'False', 'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'resolution': ('django.db.models.fields.IntegerField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'}),
            'zoom': ('django.db.models.fields.IntegerField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'})
        },
        'blueearthapp.server': {
            'Meta': {'db_table': "'servers'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'blueearthapp.userprofile': {
            'Meta': {'db_table': "'user_profiles'"},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'created_on': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'email': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'fax': ('django.db.models.fields.CharField', [], {'max_length': '12', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'locked': ('django.db.models.fields.NullBooleanField', [], {'default': 'False', 'null': 'True'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '12', 'null': 'True', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']", 'unique': 'True'}),
            'zipcode': ('django.db.models.fields.CharField', [], {'max_length': '11', 'null': 'True', 'blank': 'True'})
        },
        'contenttypes.contenttype': {
            'Meta': {'unique_together': "(('app_label', 'model'),)", 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }
    
    complete_apps = ['blueearthapp']
