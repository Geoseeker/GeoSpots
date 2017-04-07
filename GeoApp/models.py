from django.db import models

from django.contrib.auth.models import User
from django.urls import reverse


VOIVODESHIP = (
(1 , "woj. dolnośląskie"),
(2 , "woj. kujawsko-pomorskie"),
(3 , "woj. lubelskie"),
(4 , "woj. lubuskie"),
(5 , "woj. łódzkie"),
(6 , "woj. małopolskie"),
(7 , "woj. mazowieckie"),
(8 , "woj. opolskie"),
(9 , "woj. podkarpackie"),
(10 , "woj. podlaskie"),
(11 , "woj. pomorskie"),
(12 , "woj. śląskie"),
(13 , "woj. świętokrzyskie"),
(14 , "woj. warmińsko-mazurskie"),
(15 , "woj. wielkopolskie"),
(16 , "woj. zachodniopomorskie")
)





class GeoSpots(models.Model):
    name = models.CharField(max_length = 64)
    description = models.TextField()
    location = models.CharField(max_length = 64)
    voivodeship = models.IntegerField(choices=VOIVODESHIP)
    latitude = models.DecimalField(max_digits = 8, decimal_places = 6, null = True) #N or S
    longitude = models.DecimalField(max_digits = 8, decimal_places = 6, null = True) #W or E
    added_by = models.ForeignKey(User)

    def get_absolute_url(self):
        return reverse('geospot', kwargs={'id': self.id})
    
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Geostanowisko'  
        verbose_name_plural = 'Geostanowiska'  

class Collection(models.Model):    
    name = models.CharField(max_length = 64)
    description = models.TextField()
    location = models.ForeignKey(GeoSpots,null = True, blank = True)
    user_collection = models.ForeignKey(User, on_delete=models.CASCADE, null = True, blank=True)
    picture = models.ImageField(upload_to='GeoApp/static/', blank=True)
    
    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('base')
    
    
    
    
    
    
    
    
    
    
    

    
# url do formatowania 
# http://maps.google.com/maps?q=24.197611,120.780512


















