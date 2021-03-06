# Django settings for blueearth project.
import platform, os

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
   ('Averill Cate, Jr', 'acatejr@gmail.com'),
)

MANAGERS = ADMINS

DATABASE_ENGINE = 'mysql'       # 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
DATABASE_NAME = 'blueearth'     # Or path to database file if using sqlite3.
DATABASE_USER = 'blueearth'     # Not used with sqlite3.
DATABASE_PASSWORD = 'sql7'      # Not used with sqlite3.
DATABASE_HOST = ''              # Set to empty string for localhost. Not used with sqlite3.
DATABASE_PORT = ''              # Set to empty string for default. Not used with sqlite3.

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/Phoenix'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = ''

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = ''

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '!0ik*&)9a14zg3*2!%r5knh&0ommcpoa1vv2ev3%z7-$!(@ba1'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
#     'django.template.loaders.eggs.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
)

ROOT_URLCONF = 'blueearth.urls'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    'templates/',
    '/Apache/Apache2.2/htdocs/blueearth/templates',
)

INSTALLED_APPS = (
   'django.contrib.auth',
   'django.contrib.contenttypes',
   'django.contrib.sessions',
   'django.contrib.sites',
   'django.contrib.admin',
   'blueearth.blueearthapp',
)

# Location of static files
STATIC_DOC_ROOT = 'static/'
GOOGLE_MAPS_API = 'ABQIAAAAbd2kUGvc11GFpKQf3NOFzxTGJ-zR6KrmF40dL1yfeT1-VonoSRRI_InUYSCTohFhANTsLIunxAWlig'
MEDIA_URL = 'http://64.156.193.50:9000/blueearth_media/'

#GOOGLE = {
#   '128.196.156.103':'ABQIAAAAbd2kUGvc11GFpKQf3NOFzxTpiK8HATgm-nGxdsvukJ8bOB-9ghTUfetezzf8PJUojx_iMtkyoEHMBw',
#   '64.156.193.50':'ABQIAAAAbd2kUGvc11GFpKQf3NOFzxTGJ-zR6KrmF40dL1yfeT1-VonoSRRI_InUYSCTohFhANTsLIunxAWlig'
#}

#PROJECT_PATH = os.path.realpath(os.path.dirname(__file__)).replace('\\','/')
#hostname = platform.uname()[1]
#
#if hostname == "blueearrth":
#   GOOGLE_MAPS_API = 'ABQIAAAAbd2kUGvc11GFpKQf3NOFzxTGJ-zR6KrmF40dL1yfeT1-VonoSRRI_InUYSCTohFhANTsLIunxAWlig'
#   MEDIA_URL = 'http://64.156.193.50:9000/blueearth_media/'
#else:
#   GOOGLE_MAPS_API = 'ABQIAAAAbd2kUGvc11GFpKQf3NOFzxTpiK8HATgm-nGxdsvukJ8bOB-9ghTUfetezzf8PJUojx_iMtkyoEHMBw'
#   MEDIA_URL = 'http://localhost/blueearth_media/'
