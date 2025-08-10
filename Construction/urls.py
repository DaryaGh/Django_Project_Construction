from django.contrib import admin
from django.urls import path, include
from myConstruction.views import Home
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', Home , name='home'),

    #manage
    path('admin/', admin.site.urls),

    #public
    path('myConstruction/', include('myConstruction.urls')),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)