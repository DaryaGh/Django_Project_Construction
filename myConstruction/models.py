from django.contrib.contenttypes.fields import GenericForeignKey , GenericRelation
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.models import User
from django.db import models
from django.db import models
import random
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

    def __str__(self):
        return self.title


class Tag(models.Model):
    name_tag = models.CharField(max_length=200, unique=True, blank=True, null=True)
    is_active = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    def __str__(self):
        return self.name_tag


class Comment(models.Model):
    title = models.CharField(max_length=200, default='title', blank=True, null=True )
    body = models.TextField(null=True, blank=True)
    is_approved = models.BooleanField(default=False)
    admin_reply = models.TextField(null=True, blank=True)
    admin_reply_at = models.DateTimeField(null=True, blank=True)
    parent = models.ForeignKey('self', null=True, blank=True, related_name='children_comment', on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=None, null=True, blank=True)
    admin_approved = models.ForeignKey(User, on_delete=models.CASCADE, related_name='admin_approve', default=None, null=True, blank=True)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    # Generic Foreign Key
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True, blank=True)
    object_id = models.PositiveIntegerField(null=True, blank=True)
    content_object = GenericForeignKey('content_type', 'object_id')

    def __str__(self):
        return self.title


class Customer(models.Model):
    name_customer = models.CharField(max_length=100, unique=True, blank=True, null=True)
    website = models.CharField(max_length=100, unique=True, blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    is_active = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    def __str__(self):
        return self.name_customer


class ProjectType(models.Model):
    name = models.CharField(max_length=100, unique=True, blank=True, null=True)
    sort = models.IntegerField(default=0)
    is_active = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class Project(models.Model):
    title = models.CharField(max_length=100, unique=True, blank=True, null=True, default='title_project')
    body = models.TextField(null=True, blank=True)
    summary = models.TextField(null=True, blank=True)
    main_picture = models.FileField(upload_to='projects/', null=True, blank=True)
    project_web_address = models.URLField(null=True, blank=True)
    project_date = models.DateTimeField(null=True, blank=True, editable=True, auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=None, null=True, blank=True, related_name='user_project')
    project_type = models.ForeignKey(ProjectType, on_delete=models.CASCADE, null=True, blank=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, default=None, null=True, blank=True, related_name='Customer_project')
    tags = models.ManyToManyField('Tag', related_name='tags_project', blank=True)
    published_at = models.DateTimeField(default=None, null=True, blank=True)
    is_approved = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    # Generic Relation to comment
    comments = GenericRelation('Comment', related_query_name='project_comment', null=True, blank=True)

    def __str__(self):
        return self.title


    def get_random_tag(self):
        related_tags = self.tags.all()
        return random.choice(list(related_tags)) if related_tags.exists() else None


class News(models.Model):
    title = models.CharField(max_length=100, unique=True, blank=True, null=True, default='title_News')
    body = models.TextField(null=True, blank=True)
    summary = models.TextField(null=True, blank=True)
    main_picture = models.FileField(upload_to='news/', null=True, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=None, null=True, blank=True, related_name='owner')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, default=None, null=True, blank=True,related_name='Category')
    tags = models.ManyToManyField('Tag', related_name='tags', blank=True)
    published_at = models.DateTimeField(default=None, null=True, blank=True)
    is_approved = models.BooleanField(default=False)
    created_date = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)
    updated_date = models.DateTimeField(auto_now=True, editable=False, null=True, blank=True)

    # Generic Relation to comment
    comments = GenericRelation('Comment', related_query_name='news_comment', null=True, blank=True)

    def __str__(self):
        return self.title


class NewsDetails(models.Model):
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


# Gallery(other pictures) / Generic relation
class Image(models.Model):
    pass
