from django.contrib import admin
# from .models import User, Category, News, Comment, Tag, Image,Customer,Project,Service,Review ,Team ,Statistic ,ContactUs, Setting ,Movie,ProjectType
from myConstruction.models import *


admin.site.register(Category)
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