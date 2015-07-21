#from django import templat
#
#register = template.Library()
#
#@register.filter(name='properties')
#def properties(uid):
#   props = Property.objects.filter(user=uid)
#   return {'properties':props}
#   
#def imagetypes():
#   imgtypes = ImageType.objects.all()
#   return {'imagetypes':imgtypes}

#register = template.Library()
#register.inclusion_tag('properties.html')(properties)
#register.inclusion_tag('imagetypes.html')(imagetypes)
