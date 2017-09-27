# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, get_object_or_404
from blog.models import BlogPost
from django.shortcuts import render_to_response
from django.http import Http404, HttpResponseRedirect, HttpResponse
from django.template import loader
from blog.models import (
	Article,
	Category,
	Tag,
	ArticleUE,
	ArticleCK,
)
from blog.forms import UploadFileForm
from django.views.decorators.csrf import csrf_exempt
import os

# Create your views here.
#def index(request):
#	blog_list = BlogPost.objects.all()
#	return render_to_response('index.html', {'blog_list':blog_list})

def index(request):
	latest_articles_list = ArticleCK.objects.order_by('-date')	#将文章按照时间顺序生成列表
	category_list = Category.objects.order_by('-name')	#将分类按照名称顺序生成列表
	template = loader.get_template('blogs/index.html')	#获取模板html文件，该文件将在之后编写
	context = {
		'latest_articles_list' : latest_articles_list,
		'category_list' : category_list,
	}	#传给模板html的后台数据
	return render(request,'blogs/index.html',context)

def article(request,article_id):
	try:
		article = ArticleCK.objects.get(pk=article_id)	#按编号查询文章
	except Article.DoesNotExist:		#如果找不到则抛出异常处理
		raise Http404("Article does not exist")
	return render(request, 'blogs/article.html', {'article': article})

def category(request,category_id):
	cur_cat = Category.objects.get(pk = category_id)
	articles = ArticleCK.objects.filter(category = cur_cat)	#找到一个或多个该分类下的文章，因为可能是多个文章所以应该用filter函数
	return render(request, 'blogs/category.html', {'articles': articles})

@csrf_exempt
def upload_file(request):
	if request.method == 'POST':
		form = UploadFileForm(request.POST, request.FILES)

		if form.is_valid():
			fn = handle_uploaded_file(request.FILES['file'])
			return HttpResponse("Upload File OK!<br/><br/>FilePath: " + fn)

		else:
			return HttpResponse('form is not valid!')
	else:
		form = UploadFileForm()
	return render(request, 'blogs/upload.html', {'form': form})

def handle_uploaded_file(f):
    file_name = ''

    try:
        path = r'blog/upload/' 
        if not os.path.exists(path):
            os.makedirs(path)
        file_name = path + f.name
        destination = open(file_name, 'wb+')
        for chunk in f.chunks():
            destination.write(chunk)
        destination.close()
    except Exception, e:
        return 'upload error:' + str(e)

    return file_name
