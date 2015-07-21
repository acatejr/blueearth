from platform import node

from settings_local import *

if node() in DEVELOPMENT_HOSTS:
    from settings_dev import *
elif node() in PRODUCTION_HOSTS:
    from settings_prod import *
else:
    raise Exception("Cannot determine execution mode for host '%s'.  Please check DEVELOPMENT_HOST and PRODUCTION_HOST in settings_local.py." % node())
