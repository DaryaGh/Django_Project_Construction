from datetime import datetime
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.views.decorators.csrf import csrf_exempt
from myConstruction.models import *
from django.shortcuts import render
import requests
from django.http import JsonResponse
from django.utils import timezone
from django.db.models import Q
from rest_framework import generics
from django.core.paginator import Paginator
from django.shortcuts import get_object_or_404
from django.views.decorators.http import require_POST
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime



def Home(request):
    home_news = News.objects.filter(is_approved=True).order_by('-published_at')[:3]
    # print(all_news)
    # context = {
    #     'name': 'World is the best in iran',  # This will be passed to the template
    # }
    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]
    # print(home_projects)
    # random_tag = home_projects[0].tags.all()[0]
    # random_tag = home_projects[0].tags.first()
    # print(random_tag)
    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')
    # print(project_types)
    # carousels = Carousel.objects.filter(is_active=True).order_by('sort')
    # now = datetime.now()

    now = timezone.now().date()

    carousels = (Carousel.objects.filter(is_active=True)
                 .filter(Q(start_date_at__lte=now) | Q(start_date_at__isnull=True))
                 .filter(Q(end_date_at__gte=now) | Q(end_date_at__isnull=True))
                 .order_by('sort'))

    # carousels = (Carousel.objects.filter(is_active=True)
    #              .filter(start_date_at__lte = now)
    #              .filter(end_date_at__gte = now)
    #              .order_by('sort'))
    # print(datetime.now()) #date and time

    # print(datetime.date(datetime.now())) #just date
    # print(datetime.today()) #date and time

    context = {
        'home_news': home_news,
        'home_projects': home_projects,
        'project_types': project_types,
        'carousels': carousels,

        'current_date': timezone.now().strftime('%Y/%m/%d')
    }

    return render(request, 'home.html', context=context)
    # return render (request, 'home.html',context={})
    # return HttpResponse("Hello My Second WebSite")


def services(request):
    # services = Service.objects.filter(is_approved=True).order_by('-published_date')
    return render(request, 'services.html', {'services': services})


def services_details(request, id):
    return render(request, 'service_details.html', {'services': services})


def projects(request):
    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]
    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')
    # projects = Project.objects.filter(is_approved=True).order_by('-published_at')
    context = {
        'home_projects': home_projects,
        'project_types': project_types,
        # 'projects': projects,
    }
    return render(request, 'projects.html', context=context)


def project_details(request, id):
    # project = Project.objects.get(pk=id)
    # print(project.images.all())
    project = get_object_or_404(Project, pk=id)
    context = {
        'project': project,
        'images': project.images.all(),
    }
    return render(request, 'project_details.html', context=context)
    # return HttpResponse(" ")


# def news(request):
#     home_news = News.objects.filter(is_approved=True).order_by('-published_at')[:6]
#
#
#     paginator = Paginator(home_news, 3)
#     # print(news.count)
#     # print(news.num_pages)
#     # print(news.page(3))
#     page_number = request.GET.get('p', 1)
#     news_with_pagination = paginator.get_page(page_number)
#
#
#
#
#
#     # news = News.objects.filter(is_approved=True).order_by('-published_at')
#     return render(request, 'news.html', {'home_news': home_news,'newss': news_with_pagination})


def news(request):
    cat_id = request.GET.get('cat')
    tags_id = request.GET.get('tags')

    page = request.GET.get('page', 1)
    news_items = (News.objects.filter(is_approved=True)
                  .order_by('-published_at'))
    if cat_id:
        news_items = News.objects.filter(is_approved=True, category_id=cat_id)
    else:
        news_items = News.objects.filter(is_approved=True)

    if tags_id:
        news_items = News.objects.filter(is_approved=True, tags_id=tags_id)
    else:
        news_items = News.objects.filter(is_approved=True)

    news_items = news_items.order_by('-published_at')

    paginator = Paginator(news_items, 3)
    news_page = paginator.page(page)

    categories = Category.objects.filter(is_active=True).all()

    tags = Tag.objects.filter(is_active=True).all()

    recent_news = News.objects.filter(is_approved=True).order_by('-published_at')[:5]
    # print(categories)
    # print(news)

    context = {
        'news_page': news_page,
        'news_items': news_items,
        'categories': categories,
        'recent_news': recent_news,

    }

    return render(request, 'news.html', context=context)


def news_details(request, id):
    # news = News.objects.get(pk=id)
    # print(news)
    # print("News Id :" + str(id))
    news = get_object_or_404(News, pk=id)
    categories = Category.objects.filter(is_active=True).all()
    recent_news = News.objects.filter(is_approved=True).order_by('-published_at')[:5]
    # print(categories)
    # print(news)
    context = {
        "news": news,
        'categories': categories,
        'recent_news': recent_news,
    }
    return render(request, 'news_details.html', context=context)
    # return HttpResponse(" ")


# def news_view_increment(request,id):
#     # print(id)
#     news = get_object_or_404(News, pk=id)
#     news.views += 1
#     news.save()
#     # send jsonResponse
#     return JsonResponse({
#         'success': True,
#         'views': news.views,
#         'time': datetime.date(datetime.now()),
#         'message': news.title,
#         'toast_title': 'Notice',
#         'toast_color': 'warning',
#     })


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





# @require_POST
# @csrf_exempt
# def increment_view_count(request):
#     model_type = request.POST.get('model_type')
#     object_id = request.POST.get('object_id')
#
#     if not model_type or not object_id:
#         return JsonResponse({'status': 'error', 'message': 'Missing parameters'})
#
#     try:
#         if model_type == 'news':
#             obj = News.objects.get(pk=object_id)
#         elif model_type == 'project':
#             obj = Project.objects.get(pk=object_id)
#         else:
#              return JsonResponse({'status': 'error','message': 'Invalid model type'})
#
#         obj.views += 1
#         obj.save()
#
#         return JsonResponse({
#             'status' :'ok',
#             'views': obj.views,
#             'time': datetime.date(datetime.now()),
#             'message': obj.title,
#             'toast_title': 'Notice',
#             'toast_color': 'warning',
#         })
#
#     except Exception as e:
#         return JsonResponse({'status': 'error', 'message': str(e)})


def news_like(request, id):
    news = get_object_or_404(News, pk=id)

    if request.user in news.liked_by.all():
        news.liked_by.remove(request.user)
        news.like_count -= 1
    else:
        news.liked_by.add(request.user)
        news.like_count += 1

        if request.user in news.disliked_by.all():
            news.disliked_by.remove(request.user)
            news.dislike_count -= 1

    news.save()
    return JsonResponse({
        'like_count': news.like_count,
        'dislike_count': news.dislike_count
    })


# # @login_required(login_url='/login/')
# def news_like(request, id):
#     news = get_object_or_404(News, pk=id)
#     if request.user not in news.liked_by.all():
#
#         news.like_count += 1
#         news.save()
#         news.liked_by.add(request.user)
#     else:
#         print("user already liked")
#
#         if request.user in news.disliked_by.all():
#             news.disliked_by.remove(request.user)
#             news.dislike_count -= 1
#             news.save()
#
#     return JsonResponse({
#         'like_count': news.like_count,
#         'dislike_count': news.dislike_count,
#     })


def news_dislike(request, id):
    news = get_object_or_404(News, pk=id)

    if request.user in news.disliked_by.all():
        news.disliked_by.remove(request.user)
        news.dislike_count -= 1
    else:
        news.disliked_by.add(request.user)
        news.dislike_count += 1
        if request.user in news.liked_by.all():
            news.liked_by.remove(request.user)
            news.like_count -= 1
    news.save()
    return JsonResponse({
        'like_count': news.like_count,
        'dislike_count': news.dislike_count
    })


# # @login_required(login_url='/login/')
# def news_dislike(request, id):
#     news = get_object_or_404(News, pk=id)
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
#
#     return JsonResponse({
#         'like_count': news.like_count,
#         'dislike_count': news.dislike_count,
#     })
#




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
        # headers={"Content-Type": "application/json" , "Authorization": "Bearer your_token"}
    )

    if response.status_code == 404:
        data = None
    else:
        data = response.json()

    # response.raise_for_status()
    # print(response.text)
    # data = response.json()
    # print(type(data))
    # for d in data:
    #     print(d["title"])
    # return HttpResponse("Finish")
    # return render (request , 'about_us.html',{'about_us':about_us})

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
