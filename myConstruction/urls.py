from django.urls import path
# from myConstruction import views
from .views import *

urlpatterns = [


    path('Projects', projects, name='projects'),
    path('Projects/<int:id>', project_details, name='project-details'),

    path('Projects/cat/<int:cat_id>', projects, name='project_by_category'),

    # start news

    path('News', news, name='news'),
    #filter by category
    path('News/cat/<int:cat_id>', news, name='news_by_category'),
    #filter by tag
    path('News/tag/<int:tag_id>', news, name='news_by_tag'),

    path('News/<int:id>', news_details, name='news-details'),

    path('News/delete/<int:id>/', delete_news, name='delete_news'),

    path('News/<int:id>/like', news_like, name='news-like'),

    path('News/<int:id>/dislike', news_dislike, name='news-dislike'),

    path('News/<int:id>/comment', news_comment, name='news-comment'),
    # end news

    path('Services', services, name='services'),
    path('Services/<int:id>', services_details, name='services-details'),

    path('increment-views/', increment_view_count, name='increment-views'),

    path('About-us', about_us, name='about_us'),
    path('Contact-us', contact_us, name='contact_us'),
    path('History-us/', history_us, name='history_us'),

    path('author/<int:author_id>/', author_detail, name='author-detail'),
]
