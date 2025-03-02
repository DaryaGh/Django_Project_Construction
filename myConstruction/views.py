from django.http import HttpResponse
from django.shortcuts import render
from myConstruction.models import *


def Home(request):
    return HttpResponse("Hello My Second WebSite")

def services(request):
    return HttpResponse(" ")

def projects(request):
    return HttpResponse(" ")

def project_details(request, id):
    return HttpResponse(" ")

def news(request):
    return HttpResponse(" ")

def news_details(request, id):
    return HttpResponse(" ")

def contact_us(request):
    return HttpResponse(" ")

def about_us(request):
    return HttpResponse(" ")