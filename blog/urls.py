from django.conf.urls import url

from . import views

urlpatterns = [
	url(r'^$', views.index, name='index'),
	url(r'^(?P<article_id>[0-9]+)/$', views.article, name='article'),
	url(r'^cat=(?P<category_id>[0-9]+)/$', views.category, name='category'),
	url(r'^upload/$', views.upload_file, name='upload'),
	#url(r'^/upload/success/$, views.upload_success) 
]
