from django.contrib.auth.decorators import login_required
from django.urls import reverse
from unicodedata import category

from myConstruction.models import *
from django.shortcuts import render
import requests
from django.utils import timezone
from django.db.models import Q
from rest_framework import generics
from django.core.paginator import Paginator
from django.shortcuts import get_object_or_404
from django.http import JsonResponse, HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime


def Home(request):
    home_news = News.objects.filter(is_approved=True).order_by('-published_at')[:3]

    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]

    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')

    now = timezone.now().date()

    carousels = (Carousel.objects.filter(is_active=True)
                 .filter(Q(start_date_at__lte=now) | Q(start_date_at__isnull=True))
                 .filter(Q(end_date_at__gte=now) | Q(end_date_at__isnull=True))
                 .order_by('sort'))

    context = {
        'home_news': home_news,
        'home_projects': home_projects,
        'project_types': project_types,
        'carousels': carousels,

        'current_date': timezone.now().strftime('%Y/%m/%d')
    }

    return render(request, 'home.html', context=context)


def services(request):
    return render(request, 'services.html', {'services': services})


def services_details(request, id):
    return render(request, 'service_details.html', {'services': services})


def projects(request):
    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]
    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')

    context = {
        'home_projects': home_projects,
        'project_types': project_types,

    }
    return render(request, 'projects.html', context=context)


def project_details(request, id):
    project = get_object_or_404(Project, pk=id)
    context = {
        'project': project,
        'images': project.images.all(),
    }
    return render(request, 'project_details.html', context=context)


# def news(request):
#     cat_id = request.GET.get('cat')
#     tags_id = request.GET.get('tags')
#
#     page = request.GET.get('page', 1)
#     news_items = (News.objects.filter(is_approved=True)
#                   .order_by('-published_at'))
#     if cat_id:
#         news_items = News.objects.filter(is_approved=True, category_id=cat_id)
#     else:
#         news_items = News.objects.filter(is_approved=True)
#
#     if tags_id:
#         news_items = News.objects.filter(is_approved=True, tags_id=tags_id)
#     else:
#         news_items = News.objects.filter(is_approved=True)
#
#     news_items = news_items.order_by('-published_at')
#
#     paginator = Paginator(news_items, 3)
#     news_page = paginator.page(page)
#
#     categories = Category.objects.filter(is_active=True).all()
#
#     tags = Tag.objects.filter(is_active=True).all()
#
#     recent_news = News.objects.filter(is_approved=True).order_by('-published_at')[:5]
#
#     context = {
#         'news_page': news_page,
#         'news_items': news_items,
#         'categories': categories,
#         'recent_news': recent_news,
#
#     }
#
#     return render(request, 'news.html', context=context)

def news(request, cat_id=None, tag_id=None):
    # print("tag_id is ", tag_id)
    # print("cat_id",cat_id)
    category_name = None
    tag_name = None

    page = request.GET.get('page', 1)

    news = News.objects.filter(is_approved=True)

    if tag_id:
        # filter News objects that have a Tag with id = tag_id

        tag = Tag.objects.filter(id=tag_id)

        if not tag:
            return HttpResponseRedirect(reverse('news'))
        else:
            # tag_name = tag.first().name_tag
            tag_name = tag[0].name_tag
            news = news.filter(tags__id=tag_id)
    if cat_id is not None:
        category = Category.objects.filter(id=cat_id)

        # برای اینکه شماره غلط وارد میکند بپرد و به شکل اول بشه
        if not category:
            # url = reverse('news')
            return HttpResponseRedirect(reverse('news'))
        else:
            category_name = category[0].title
            news = news.filter(category_id=cat_id)
        # category_name = Category.objects.get(id=cat_id).title
        # category_name = Category.objects.get(id=cat_id)
        print(category_name)
    news = news.order_by('-published_at')

    # if cat_id is None:
    #     news= News.objects.filter(is_approved=True).order_by('-published_at')
    # else:
    #     news = News.objects.filter(is_approved=True).filter(category_id=cat_id).order_by('-published_at')

    paginator = Paginator(news, 3)
    news = paginator.page(page)
    context = {
        # 'news_page': news_page,
        # 'news_items': news_items,
        # 'categories': categories,
        # 'recent_news': recent_news,
        'news': news,
        'category_name': category_name,
        'tag_name': tag_name,

    }

    return render(request, 'news.html', context=context)


def news_details(request, id):
    news = get_object_or_404(News, pk=id)
    categories = Category.objects.filter(is_active=True).all()
    recent_news = News.objects.filter(is_approved=True).order_by('-published_at')[:5]

    context = {
        "news": news,
        'categories': categories,
        'recent_news': recent_news,
    }
    return render(request, 'news_details.html', context=context)


@require_POST
@csrf_exempt
def increment_view_count(request):
    model_type = request.POST.get('model_type')
    object_id = request.POST.get('object_id')

    if not model_type or not object_id:
        return JsonResponse({'status': 'error', 'message': 'Missing parameters'})

    viewed_key = f'viewed_{model_type}_{object_id}'

    try:
        if model_type == 'news':
            obj = News.objects.get(pk=object_id)
        elif model_type == 'project':
            obj = Project.objects.get(pk=object_id)
        else:
            return JsonResponse({'status': 'error', 'message': 'Invalid model type'})

        if not request.session.get(viewed_key):
            obj.views += 1
            obj.save()
            request.session[viewed_key] = True
            request.session.set_expiry(86400)

            return JsonResponse({
                'status': 'ok',
                'views': obj.views,
                'message': obj.title,
                'toast_color': 'warning',
                'time': datetime.date(datetime.now()),
                'toast_title': 'Notice',
            })
        else:
            return JsonResponse({
                'status': 'ok',
                'views': obj.views,
                'message': 'Already viewed',
                'toast_color': 'success',
                'toast_title': 'Notice',
                'time': datetime.date(datetime.now()),
            })

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})


@require_POST
@login_required
def news_like(request, id):
    news = get_object_or_404(News, pk=id)
    user = request.user
    liked = False

    if user in news.liked_by.all():
        news.liked_by.remove(user)
        news.like_count -= 1
        action = 'like_removed'
    else:
        news.liked_by.add(user)
        news.like_count += 1
        liked = True
        action = 'like_added'
        # اگر قبلاً دیسلایک کرده بود، آن را حذف کن
        if user in news.disliked_by.all():
            news.disliked_by.remove(user)
            news.dislike_count -= 1

    news.save()
    return JsonResponse({
        'status': 'success',
        'action': action,
        'liked': liked,
        'like_count': news.like_count,
        'dislike_count': news.dislike_count
    })


# # @login_required
# def news_like(request, id):
#
#     news = get_object_or_404(News, pk=id)
#
#     if request.user not in news.liked_by.all():
#         news.like_count += 1
#         news.save()
#         news.liked_by.add(request.user)
#
#     if request.user in news.disliked_by.all():
#             news.disliked_by.remove(request.user)
#             news.dislike_count -= 1
#             news.save()
#
#     return JsonResponse({
#         'like_count': news.like_count,
#         'dislike_count': news.dislike_count
#     })


# def news_like(request,id):
#     return HttpResponse("you clicked like")
#
# def news_dislike(request,id):
#     return HttpResponse("you clicked dislike")

# def news_dislike(request, id):
#     news = get_object_or_404(News, pk=id)
#
#     if request.user in news.disliked_by.all():
#         news.disliked_by.remove(request.user)
#         news.dislike_count -= 1
#
#     else:
#         news.disliked_by.add(request.user)
#         news.dislike_count += 1
#         if request.user in news.liked_by.all():
#             news.liked_by.remove(request.user)
#             news.like_count -= 1
#     news.save()
#     return JsonResponse({
#         'status': 'success',
#         'like_count': news.like_count,
#         'dislike_count': news.dislike_count
#     })

@require_POST
@login_required
def news_dislike(request, id):
    news = get_object_or_404(News, pk=id)
    user = request.user
    disliked = False

    if user in news.disliked_by.all():
        news.disliked_by.remove(user)
        news.dislike_count -= 1
        action = 'dislike_removed'
    else:
        news.disliked_by.add(user)
        news.dislike_count += 1
        disliked = True
        action = 'dislike_added'
        # اگر قبلاً لایک کرده بود، آن را حذف کن
        if user in news.liked_by.all():
            news.liked_by.remove(user)
            news.like_count -= 1

    news.save()
    return JsonResponse({
        'status': 'success',
        'action': action,
        'disliked': disliked,
        'like_count': news.like_count,
        'dislike_count': news.dislike_count
    })


# def news_dislike(request, id):
#     news = get_object_or_404(News, pk=id)
#
#     if request.user not in news.disliked_by.all():
#         news.dislike_count += 1
#         news.save()
#         news.disliked_by.add(request.user)
#
#         if request.user in news.liked_by.all():
#             news.liked_by.remove(request.user)
#             news.like_count -= 1
#             news.save()
#
#     return JsonResponse({
#         'status': 'success',
#         'like_count': news.like_count,
#         'dislike_count': news.dislike_count
#     })


@csrf_exempt
@require_POST
def delete_news(request, id):
    try:
        news = News.objects.get(id=id)
        news.delete()
        return JsonResponse({'status': 'success', 'message': 'News deleted successfully'})
    except News.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'News not found'}, status=404)


def contact_us(request):
    return render(request, 'contact_us.html', {'contact_us': contact_us})


def about_us(request):
    response = requests.get(
        "https://jsonplaceholder.typicode.com/posts",
        params={"param1": "value1"},
    )

    if response.status_code == 404:
        data = None
    else:
        data = response.json()

    bootstrap_colors = ['primary', 'secondary', 'success', 'danger', 'warning', 'info', 'light', 'dark']
    bootstrap_color = ['dark', 'light']
    boxes = []
    for i in range(1):
        color = random.choice(bootstrap_colors)
        colors = random.choice(bootstrap_color)
        boxes.append({
            'border_class': f'border-{colors}',
            'bg_class': f'bg-{color}',
            'text_class': f'text-{"white" if color in ["primary", "secondary", "success", "danger", 'warning', 'info', 'light'] else "dark"}',
            'index': i + 1
        })

    return render(request, 'about_us.html', {'data': data, 'boxes': boxes})
