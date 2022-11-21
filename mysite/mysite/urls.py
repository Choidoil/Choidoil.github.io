
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from mysite.views import HomeView,BotView,CrawlingForm,dispcrawling
from mysite.views import UserCreateDoneTV,UserCreateView
from mysite import views 
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', HomeView.as_view(), name='home'),
    path('schedualbot/', BotView.as_view(), name='schedualbot'),
    path('crawlingform/', CrawlingForm.as_view(), name='crawlingform'),
    path('dispCrawling/',views.dispcrawling,name='dispCrawling'),
    path('bookmark/', include('bookmark.urls')),
    path('blog/', include('blog.urls')),
    path('photo/', include('photo.urls')),
    path('polls/', include('polls.urls')),
    path('accounts/',include('django.contrib.auth.urls')),
    path('accounts/register/',UserCreateView.as_view(),name='register'),
    path('accounts/register/done/',UserCreateDoneTV.as_view(),name='register_done'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

