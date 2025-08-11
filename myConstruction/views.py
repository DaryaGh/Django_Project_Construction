from django.contrib.auth.decorators import login_required
from django.urls import reverse
import Construction
from myConstruction.models import *
from django.shortcuts import render
import requests
from django.utils import timezone
from django.db.models import Q, Count
from django.core.paginator import Paginator
from django.shortcuts import get_object_or_404
from django.http import JsonResponse, HttpResponse, HttpResponseRedirect
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import json


def Home(request):
    home_news = News.objects.filter(is_approved=True).order_by('-published_at')[:3]

    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]

    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')

    now = timezone.now().date()

    carousels = (Carousel.objects.filter(is_active=True)
                 .filter(Q(start_date_at__lte=now) | Q(start_date_at__isnull=True))
                 .filter(Q(end_date_at__gte=now) | Q(end_date_at__isnull=True))
                 .order_by('sort'))

    swiper = Swiper.objects.filter(is_active=True)

    construction = Construction.objects.filter(is_active=True)

    services = Service.objects.filter(is_active=True)
    servicesfeature = ServicesFeature.objects.filter(is_active=True)

    # content = Content.objects.filter(is_active=True)

    context = {
        'home_news': home_news,
        'home_projects': home_projects,
        'project_types': project_types,
        'carousels': carousels,
        'swiper': swiper,
        'construction': construction,
        'services': services,
        'servicesfeature': servicesfeature,
        # 'content': content,
        'current_date': timezone.now().strftime('%Y/%m/%d')
    }

    return render(request, 'home.html', context=context)


def services(request):
    services = Service.objects.filter(is_active=True)
    print(services)
    feature = Feature.objects.filter(is_active=True)
    servicesfeatures = ServicesFeature.objects.filter(is_active=True)
    swiper = Swiper.objects.filter(is_active=True)

    context={
        'services': services,
        'feature': feature,
        'servicesfeatures': servicesfeatures,
        'swiper': swiper,
    }

    return render(request, 'services.html', context=context)


def services_details(request, id):
    servicesdetails = ServicesDetail.objects.filter(is_active=True)

    return render(request, 'service_details.html', {'servicesdetails': servicesdetails})

def projects(request, cat_id=None, ):
    category_name = None
    home_projects = Project.objects.filter(is_approved=True).order_by('-published_at')[:12]
    project_types = ProjectType.objects.filter(is_active=True).order_by('sort')
    project = Project.objects.none()

    if cat_id is not None:
        category = Category.objects.filter(id=cat_id).first()

        if not category:
            return HttpResponseRedirect(reverse('projects'))
        else:
            category_name = category.title
            # print('category_name:', category_name)
            projects = Project.objects.filter(category_id=cat_id)
            # print(projects)

        # print(category_name)

    if cat_id is not None:
        category = Category.objects.filter(id=cat_id).first()  # استفاده از first() به جای [0]

        if not category:
            return HttpResponseRedirect(reverse('projects'))
        else:
            category_name = category.title
            home_projects = home_projects.filter(category_id=cat_id)  # فیلتر روی home_projects

    context = {
        'home_projects': home_projects,
        'project_types': project_types,
        'category_name': category_name,
        # 'projects': projects
    }

    return render(request, 'projects.html', context=context)


def project_details(request, id):
    project = get_object_or_404(Project, pk=id)
    context = {
        'project': project,
        'images': project.images.all(),
    }
    return render(request, 'project_details.html', context=context)


def news(request, cat_id=None, tag_id=None):
    category_name = None
    tag_name = None

    page = request.GET.get('page', 1)

    news = News.objects.filter(is_approved=True)

    if request.method == "GET" and request.GET.get('query') is not None:
        news = news.filter(title__icontains=request.GET.get('query'))

    if tag_id:

        tag = Tag.objects.filter(id=tag_id)

        if not tag:
            return HttpResponseRedirect(reverse('news'))
        else:

            tag_name = tag[0].name_tag
            news = news.filter(tags__id=tag_id)

    if cat_id is not None:
        category = Category.objects.filter(id=cat_id)

        if not category:
            return HttpResponseRedirect(reverse('news'))
        else:
            category_name = category[0].title
            news = news.filter(category_id=cat_id)

    news = news.order_by('-published_at')

    paginator = Paginator(news, 3)
    news = paginator.page(page)
    context = {
        'news': news,
        'category_name': category_name,
        'tag_name': tag_name,
    }

    return render(request, 'news.html', context=context)


def news_details(request, id):
    news = get_object_or_404(News, pk=id)

    # print(news.comments.all())

    # news = get_object_or_404(
    #     News.objects.prefetch_related('authors', 'tags', 'comments'),
    #     pk=id,
    #     is_active=True
    # )
    author = news.author

    comments = news.comments.filter(is_approved=True).filter(parent_id=None).order_by('-created_date')

    # authors = news.authors.filter(is_active=True)
    categories = Category.objects.filter(is_active=True).all()

    base_query = News.objects.filter(is_approved=True).exclude(pk=id)

    recent_news = base_query.order_by('-published_at')[:5]

    most_visited_news = base_query.order_by('-views')[:5]
    interested_news = base_query.order_by('-like_count')[:5]
    # discuss_news = base_query.order_by('-comments')[:5]

    discuss_news = base_query.annotate(comment_count=Count('comments')).order_by('-comment_count')[:5]

    context = {
        "news": news,
        'categories': categories,
        'recent_news': recent_news,
        'most_visited_news': most_visited_news,
        'interested_news': interested_news,
        # 'discuss_news': discuss_news,
        "discuss_news": discuss_news,
        'comments': comments,
        'author': author,
    }
    return render(request, 'news_details.html', context=context)


def news_comment(request, id):

    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            # print(data)
            # print(ContentType.objects.get_for_model(News))

            email = data.get('email')
            # username = data.get('username')
            website = data.get('website')
            comment = data.get('comment')
            object_id = id
            content_type = ContentType.objects.get_for_model(News)

            if data.get("parent"):
                parent_id = data.get('parent')
            else:
                parent_id = None

            new_comment = Comment()

            new_comment.username_comment = request.user
            new_comment.body = comment
            new_comment.email_comment = email
            new_comment.website_comment = website
            new_comment.object_id = object_id
            new_comment.content_type = content_type
            if parent_id:
                new_comment.parent = Comment.objects.get(id=parent_id)
            new_comment.save()

            return JsonResponse({'success': 'a new comment added successfully'}, status=200)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON or some error '}, status=400)

    # print("inja")
    # print(request.POST.get('email'))
    return JsonResponse(
        {
            'message': 'Success'
        }
    )


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
        "https://jsonplaceholder.typicode.com/postsccc",
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

def history_us(request):
    history = HistoryUs.objects.all()

    swiper = Swiper.objects.filter(is_active=True)

    servicesfeatures = ServicesFeature.objects.filter(is_active=True)

    team = Team.objects.filter(is_active=True)

    context = {
        'history': history,
        'swiper': swiper,
        'servicesfeatures': servicesfeatures,
        'team': team,
    }
    return render(request, 'history_us.html', context=context)

def author_detail(request, author_id):
    author = get_object_or_404(Author, pk=author_id, is_active=True)
    author_news = News.objects.filter(
        author=author,
        is_approved=True,
        is_active=True
    ).order_by('-published_at')

    context = {
        'author': author,
        'news_list': author_news,
    }
    return render(request, 'author_detail.html', context)
