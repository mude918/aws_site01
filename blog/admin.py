# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from blog.models import (
	Article,
	Category, 
	Tag,
	ArticleUE,
	ArticleCK,
)


# Register your models here.

class ArticlePostAdmin(admin.ModelAdmin):
	list_display = ('title', 'date', 'category')

admin.site.register(Article, ArticlePostAdmin)
admin.site.register(Category)
admin.site.register(Tag)
admin.site.register(ArticleUE)
admin.site.register(ArticleCK)
