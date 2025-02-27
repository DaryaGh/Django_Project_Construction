# from django.contrib.contenttypes.fields import GenericRelation
# from django.contrib.contenttypes.models import ContentType
from django.db import models
from enum import Enum



class CategoryType(Enum):
    NEWS = 'News'
    PROJECT = 'Project'

    @classmethod
    def choices(cls):
        return [(tag.value, tag.name) for tag in cls]


class Category(models.Model):
    title = models.CharField(max_length=100, unique=True, blank=True, null=True)      #2 zabaneh ham kalame farsi ham english ro bayad zakhireh konid  #null ro dar enteha refactor konid
    type = models.CharField(max_length=10, choices=CategoryType.choices())
    is_active = models.BooleanField(default=True)
    model_name = models.CharField(max_length=100, unique=True, blank=True, null=True)  #news,project,...
    # content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.title


class ProjectType(models.Model):
    pass


class ProjectDetails(models.Model):
    pass


class Project(models.Model):
    pass
    # name = models.CharField(max_length=100, unique=True, blank=True, null=True)
    # description = models.TextField(blank=True, null=True)
    # categories = GenericRelation(Category)




class News(models.Model):
    pass
    # title = models.CharField(max_length=100, unique=True, blank=True, null=True)
    # content = models.TextField(blank=True, null=True)
    # categories = GenericRelation(Category)


class Service(models.Model):
    pass


class ServiceDetail(models.Model):
    pass


class Comment(models.Model):
    pass


class Review(models.Model):
    pass


class Team(models.Model):
    pass


class Statistic(models.Model):
    pass


class ContactUs(models.Model):
    pass
    # phone  = models.CharField(max_length=100, unique=True, blank=True, null=True)
    # address = models.CharField(max_length=100, unique=True, blank=True, null=True)
    # email = models.CharField(max_length=100, unique=True, blank=True, null=True)



class Blog(models.Model):
    pass


class BlogDetail(models.Model):
    pass


class Tag(models.Model):
    pass


class Setting(models.Model): # jadval tak record(title , link safahat ejtemi, tarikhche ,....)
    pass


class Movie(models.Model):
    pass

class User(models.Model):
    pass