from django.urls import path

from api import views

urlpatterns = [
    path('test/', views.test, name='test'),
    path('login/', views.login, name='login'),
    path('click/', views.click, name='click')
]
