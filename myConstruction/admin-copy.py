# from .models import User, Category, News, Comment, Tag, Image,Customer,Project,Service,Review ,Team ,Statistic ,ContactUs, Setting ,Movie,ProjectType
from myConstruction.models import *
from django.contrib import admin
# from jalali_date import datetime2jalali, date2jalali
# from jalali_date.admin import ModelAdminJalaliMixin, StackedInlineJalaliMixin, TabularInlineJalaliMixin
# import json

@admin.register(Carousel)
class CarouselAdmin(admin.ModelAdmin):
    list_display = ('title','is_active')
    # list_filter = ('is_active')
    search_fields = ('title', 'caption')



# class MyInlines1(TabularInlineJalaliMixin, admin.TabularInline):
#     model = News
#
# @admin.register(News)
# class NewsModelAdmin(ModelAdminJalaliMixin, admin.ModelAdmin):
#
#     def data_display(self, obj):
#
#          return json.dump(obj.data_display , indent=2 , sort_keys=True , default=date2jalali , ensure_ascii=False)
#
#     data_display.short_description = 'Data Display'



admin.site.register(Category)
# admin.site.register(Carousel)
admin.site.register(News)
admin.site.register(Comment)
admin.site.register(Tag)
admin.site.register(Customer)
admin.site.register(Project)
admin.site.register(ProjectType)
admin.site.register(Image)
admin.site.register(Service)
# admin.site.register(Review)
admin.site.register(ContactUs)
# admin.site.register(Team)
# admin.site.register(Statistic)
admin.site.register(Setting)
admin.site.register(Movie)
admin.site.register(Author)