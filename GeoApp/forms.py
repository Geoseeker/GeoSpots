from django import forms
from django.contrib.gis import forms
from GeoApp.models import User, VOIVODESHIP, Collection, GeoSpots
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate
  
users = User.objects.all()
#.values_list('first_name','last_name').order_by('last_name')
  
class AddGeoSpotForm(forms.Form):
    name = forms.CharField(label = 'nazwa stanowiska', max_length = 64, required=True)
    description = forms.CharField(label = 'opis stanowiska',widget=forms.Textarea, required=True)
    location = forms.CharField(label = 'lokalizacja', max_length = 64, required=True)
    voivodeship = forms.ChoiceField(label = 'Województwo', choices = VOIVODESHIP)
    latitude = forms.DecimalField(label = 'N',max_digits = 8, decimal_places = 6, initial = '52.330204', required = True)
    longitude = forms.DecimalField(label = 'E',max_digits = 8, decimal_places = 6, initial = '19.974818', required = True)
    added_by = forms.ModelChoiceField(queryset = users) 
   
class RegisterUserForm(forms.ModelForm):
    class Meta:
     model = User
     fields = ['username', 'first_name', 'last_name', 'email', 'password']
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['password'].widget = forms.PasswordInput()
       
    def clean(self):
        cleaned_data = super().clean()
        raw_password = cleaned_data['password']
        cleaned_data['password'] = make_password(raw_password)
           
        return cleaned_data
      
class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)
      
    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data['username']
        password = cleaned_data['password']
        user = authenticate(username=username, password=password)
        if user is None:
            raise forms.ValidationError('Błędny login lub hasło')
        cleaned_data['user'] = user        
        return cleaned_data
    
class SearchForm(forms.Form):
    name = forms.CharField(label='Geostanowisko',max_length=3, widget=forms.TextInput(attrs={'placeholder': 'Gdzie szukać?'}))

    
class MyGeoForm(forms.Form):
    point = forms.PointField(widget=forms.OSMWidget(attrs={'map_width': 800, 'map_height': 500}))
    
    
    
    
    
    
    