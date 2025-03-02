from django.contrib.contenttypes.fields import GenericForeignKey , GenericRelation
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.models import User
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


class Tag(models.Model):
    name_tag = models.CharField(max_length=200, unique=True, blank=True, null=True)
    is_active = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    def __str__(self):
        return self.name_tag


class Customer(models.Model):
    pass


class ProjectType(models.Model):
    pass

class NewsDetails(models.Model):
    pass

class Project(models.Model):
    pass

class News(models.Model):
    pass


class Service(models.Model):
    pass


class ServiceDetail(models.Model):
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


class Setting(models.Model): # jadval tak record(title , link safahat ejtemi, tarikhche ,....)
    pass


class Movie(models.Model):
    pass
