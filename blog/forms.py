from django import forms

class UploadFileForm(forms.Form):
	title = forms.CharField(required=False, max_length = 50)
	#title = forms.CharField(max_length = 50)
	file = forms.FileField()
