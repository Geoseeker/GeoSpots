from django.shortcuts import render
from django.views import View
from GeoApp.forms import RegisterUserForm, LoginForm, AddGeoSpotForm, MyGeoForm, SearchForm
from django.contrib.auth import login, logout, get_user_model
from django.http import HttpResponseRedirect
from GeoApp.models import GeoSpots, Collection
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView
from django.urls import reverse, reverse_lazy
  
  
class BaseView(View):
    def get(self, request):
        return render(request, 'base.html', {})
  
class GeoSpotsView(LoginRequiredMixin,View):
    def get(self, request):
        spots = GeoSpots.objects.all()
        ctx = {'spots' : spots}
        return render(request, 'geospots.html', ctx)
  
class GeoMapView(View):
    def get(self,request):
        map = MyGeoForm()
        ctx = {'map':map}
        return render(request, 'map.html', ctx)
     
class AddGeospotView(LoginRequiredMixin, View):
    def get(self,request):
        form = AddGeoSpotForm()
        ctx = {'form' : form}
        return render(request, 'add_geospot.html', ctx)
    def post(self, request):
        form = AddGeoSpotForm(data=request.POST)
        ctx = {'form' : form}
        if form.is_valid():
            name = form.cleaned_data['name']
            description = form.cleaned_data['description']
            location = form.cleaned_data['location']
            voivodeship = form.cleaned_data['voivodeship']
            latitude = form.cleaned_data['latitude']
            longitude = form.cleaned_data['longitude']
            added_by = form.cleaned_data['added_by']
            GeoSpots.objects.create(
                name = name,
                description = description,
                location = location,
                voivodeship = voivodeship,
                latitude = latitude,
                longitude = longitude,
                added_by = added_by)
            return HttpResponseRedirect('geospots')
        return render(request, 'add_geospot.html', ctx)
     
class GeoSpotView(View,LoginRequiredMixin):
    def get(self, request, id):
        geospot = GeoSpots.objects.get(id=id)
        ctx = {'geospot' : geospot}
        return render(request, 'geospot.html', ctx)
    
class GeoSpotModifyView(LoginRequiredMixin,UpdateView):
    model = GeoSpots
    fields = '__all__'
    
class GeoSpotSearchView(LoginRequiredMixin,View):
    def get(self, request):
        ctx = {'form': SearchForm()}
        return render(request, 'geo_search.html', ctx)
        
    def post(self, request):
        form = SearchForm(data=request.POST)
        ctx = {'form': form}
        if form.is_valid():
            name = form.cleaned_data['name']
            geospots = GeoSpots.objects.filter(name__icontains=name)
            ctx['results'] = geospots
        return render(request, 'geospots_results.html', ctx)
                 
class CollectionView(View,LoginRequiredMixin):
    def get(self, request):
        collection = Collection.objects.all()
        ctx = {'collection': collection}
        return render(request,'collection.html', ctx)
    
class CollectionDetailView(LoginRequiredMixin, View):
    def get(self, request, id):
        item = Collection.objects.get(id=id)
        ctx = {'item': item}
        return render(request, 'detail_collection.html', ctx)
     
# class MyCollectionView(LoginRequiredMixin, View):
#     def get(self, request, id):
#         collection = Collection.objects.filter(user_collection=id)
#         ctx = {'collection': collection}
#         return render(request,'mycollection.html', ctx)

class MyCollectionView(LoginRequiredMixin, View):
    def get(self, request):
        collection = Collection.objects.filter(user_collection=request.user)
        ctx = {'collection': collection}
        return render(request,'mycollection.html', ctx)
# <a href="{% url 'my-collection' id=user.id %}"><input type="submit" value='Zobacz swoją kolekcję'></a>
 
class AddCollectionView(LoginRequiredMixin, CreateView):
    model = Collection
    fields = '__all__'
    success_url = reverse_lazy('collection')
    
class ModifyCollectionView(LoginRequiredMixin, UpdateView):
    model = Collection
    fields = '__all__'
    success_url = reverse_lazy('collection')
           
       
  
class RegisterUserView(View):
    def get(self, request):
        form = RegisterUserForm()
        ctx = {'form': form}
        return render(request, 'GeoApp/register_profile_form.html', ctx)
       
    def post(self, request):
        form = RegisterUserForm(data=request.POST)
        ctx = {'form': form}
        if form.is_valid():
            profile = form.save()
            login(request, profile)
            return HttpResponseRedirect(reverse('base'))
        else:
            return render(request, 'GeoApp/register_profile_form.html', ctx)
  
      
class UserLoginView(View):
    def get(self, request):
        ctx = {'form': LoginForm()}
        return render(request, 'login.html', ctx)
    def post(self, request):
        form = LoginForm(data=request.POST)
        ctx = {'form': form}
        if form.is_valid():
            user = form.cleaned_data['user']
            login(request, user)
            return HttpResponseRedirect(reverse('base'))
        else:
            return render(request, 'login.html', ctx)
  
class UserLogoutView(LoginRequiredMixin,View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('login'))
      