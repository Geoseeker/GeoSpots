from django.contrib import admin
from .models import GeoSpots, Collection
 
# admin.site.register(Collection)
# admin.site.register(GeoSpots)

  
@admin.register(Collection)
class CollectionAdmin(admin.ModelAdmin):
       list_display = ['name', 'description']
  
@admin.register(GeoSpots)
class GeoSpotsAdmin(admin.ModelAdmin):
      list_display = ['name', 'description', 'location', 'added_by']
      
      