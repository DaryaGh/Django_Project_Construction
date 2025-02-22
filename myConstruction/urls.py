from django.urls import path
from myConstruction import views

urlpatterns = [
    path('home', views.home, name='home'),
]