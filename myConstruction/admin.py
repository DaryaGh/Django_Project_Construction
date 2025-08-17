from myConstruction.models import *
from django.contrib import admin

@admin.register(Carousel)
class CarouselAdmin(admin.ModelAdmin):
    list_display = ('title','is_active')

    search_fields = ('title', 'caption')

admin.site.register(Category)
admin.site.register(News)
admin.site.register(Comment)
admin.site.register(Tag)
admin.site.register(Customer)
admin.site.register(Project)
admin.site.register(ProjectType)
admin.site.register(Image)
admin.site.register(Service)
admin.site.register(ContactUs)
admin.site.register(Setting)
admin.site.register(Movie)
admin.site.register(Author)
admin.site.register(Swiper)
admin.site.register(Feature)
admin.site.register(ServicesFeature)
admin.site.register(ServicesDetail)
admin.site.register(Construction)
admin.site.register(HistoryUs)
admin.site.register(Team)