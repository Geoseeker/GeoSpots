"""GeoSpots URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.conf.urls.static import static
from GeoApp.views import (AddGeospotView,
                          AddCollectionView,
                           BaseView,
                           CollectionView,
                           CollectionDetailView,
                           GeoMapView,
                           GeoSpotsView,
                           GeoSpotView,
                           GeoSpotSearchView,
                           GeoSpotModifyView,
                           ModifyCollectionView,
                           MyCollectionView,
                           RegisterUserView,
                           UserLoginView, 
                           UserLogoutView)


urlpatterns = [
     url(r'^admin/', admin.site.urls),
     url(r'^geoapp$', BaseView.as_view(), name = 'base'),
     url(r'^geoapp/geospots$', GeoSpotsView.as_view(), name = 'geospots'),
     url(r'^geoapp/add_geospot$', AddGeospotView.as_view(), name = 'add-geospot'),
     url(r'^geoapp/geospots/(?P<id>(\d)+)', GeoSpotView.as_view(), name = 'geospot'),
     url(r'^geoapp/geospots/update_view/(?P<pk>(\d)+)', GeoSpotModifyView.as_view(), name = 'update-geospot'),
     url(r'^geoapp/collection$', CollectionView.as_view(), name= 'collection'),
     url(r'^geoapp/collection/(?P<id>(\d)+)', CollectionDetailView.as_view(), name = 'detail-collection'),
     url(r'^geoapp/mycollection', MyCollectionView.as_view(), name = 'my-collection'), 
     url(r'^geoapp/add_colection/(?P<id>(\d)+)', AddCollectionView.as_view(), name='add-collection'),
     url(r'^geoapp/collection/update_view/(?P<pk>(\d)+)', ModifyCollectionView.as_view(), name = 'update-collection'),
     url(r'^geoapp/geo_search$', GeoSpotSearchView.as_view(), name='geo-search'),
     url(r'^geoapp/map',GeoMapView.as_view(), name = 'map' ),
     url(r'^register/', RegisterUserView.as_view(), name = 'register'),
     url(r'^login', UserLoginView.as_view(), name = 'login'),
     url(r'^logout', UserLogoutView.as_view(), name = 'logout'),
    ]
