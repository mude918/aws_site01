# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib import admin
from django.utils.encoding import python_2_unicode_compatible
from DjangoUeditor.models import UEditorField
from ckeditor.fields import RichTextField

# Create your models here.
class BlogPost(models.Model):
	title = models.CharField(max_length = 150)
	body = models.TextField()
	timestamp = models.DateTimeField()

class BlogPostAdmin(admin.ModelAdmin):
	list_display = ('title', 'timestamp')

@python_2_unicode_compatible		#如果要求python2支持utf-8则需要加上此句
class Category(models.Model):
	name = models.CharField(u'名称', max_length = 20)
	def __str__(self):
		return self.name;

@python_2_unicode_compatible
class Tag(models.Model):
	name = models.CharField(u'名称', max_length = 20)
	def __str__(self):
		return self.name;

@python_2_unicode_compatible
class Article(models.Model):
	title = models.CharField(u'标题',max_length = 150)
	body = models.TextField(u'正文')
	date = models.DateTimeField(u'发布时间')
	category = models.ForeignKey(Category, verbose_name=u'分类')
	tags = models.ManyToManyField(Tag, verbose_name = u'标签', blank=True)
	# models.ForeignKey表示一个Article有一个Category
	# models.ManyToManyField表示一个Article有多个Tag，blank=True表示可以为空
	def __str__(self):
		return self.title

@python_2_unicode_compatible
class ArticleCK(models.Model):
	title = models.CharField(u'标题',max_length = 150)
	body = RichTextField(blank=True, null=True, verbose_name=u'正文')
	date = models.DateTimeField(u'发布时间')
	category = models.ForeignKey(Category, verbose_name=u'分类')
	tags = models.ManyToManyField(Tag, verbose_name = u'标签', blank=True)
	# models.ForeignKey表示一个Article有一个Category
	# models.ManyToManyField表示一个Article有多个Tag，blank=True表示可以为空
	def __str__(self):
		return self.title
@python_2_unicode_compatible
class ArticleUE(models.Model):
	title = models.CharField(u'标题',max_length = 150)
	#body = UEditorField(u'正文', width=600, height=300, toolbars='full', imagePath='/static/', filePath='/upload/', upload_settings={'imageMaxSize':4*1024000}, settings={},command=None,event_handler=None, blank=True)
	body = UEditorField(u'正文', width=600, height=300, toolbars='full', imagePath='/static/', filePath='/upload/', blank=True)
	#body = models.TextField(u'正文')
	date = models.DateTimeField(u'发布时间')
	category = models.ForeignKey(Category, verbose_name=u'分类')
	tags = models.ManyToManyField(Tag, verbose_name = u'标签', blank=True)
	# models.ForeignKey表示一个Article有一个Category
	# models.ManyToManyField表示一个Article有多个Tag，blank=True表示可以为空
	def __str__(self):
		return self.title

admin.site.register(BlogPost, BlogPostAdmin)
