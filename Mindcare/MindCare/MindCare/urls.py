"""MindCare URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from MindCareApp.views import *


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index,name='index'),
    path('login/', login,name='login'),
    path('logout/', logout,name='logout'),
    path('register/', register,name='register'),
    path('forgot_password/', forgotPassword_view, name='forgot_password'),

    path('createAccount/', createAccount,name='create_account'),
    path('loginAccount/', loginAccount,name='login_account'),
    path('appHome/', appHome,name='home'),
    path('chatbot/', chatbot_view,name='chatbot'),
    path('chatRequest/', chatRequest,name='chatRequest'),
    path('music/', music,name='music'),
    path('activity/', activity,name='activity'),
    path('startActivity/', startActivity,name='startActivity'),
    path('search_activity/', search_activity,name='search_activity'),
    path('professionals/', professionals,name='professionals'),
    path('progress/', progress,name='progress'),
    path('search_professionals/', search_professionals,name='search_professionals'),
    path('get_progress/', get_progress,name='get_progress'),
    path('backup_password/', forgot_password, name='backup_password'),

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)