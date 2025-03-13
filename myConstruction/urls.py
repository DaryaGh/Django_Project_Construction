from django.urls import path
# from myConstruction import views
from .views import *

urlpatterns = [
    path('About-us', about_us, name='about_us'),
    path('Contact-us', contact_us, name='contact_us'),
    path('Projects', projects, name='projects'),
    path('Projects/<int:id>',project_details, name='project-details'),
    path('News', news, name='news'),
    path('News/<int:id>',news_details, name='news-details'),
    path('Services', services, name='services'),
]

