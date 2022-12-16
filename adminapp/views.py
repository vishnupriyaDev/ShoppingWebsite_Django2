from django.shortcuts import render
from django.http import HttpResponseRedirect,JsonResponse
from adminapp.models import *
import random
import string
from django.conf import settings
from django.contrib.auth.models import User
import os
from app6.models import *
# Create your views here.


##########################################################################################################################################
################################################Admin#####################################################################################


def admin_index(request):
	return render(request,'admin/index.html')

def admin_inputs(request):
	if request.method == "POST":
		cname=request.POST['name']
		cprice=request.POST['price']
		cdesc=request.POST['desc']
		cimage=request.FILES['image']
		cgender=request.POST['gender']
		ccategory=request.POST['Category']
		check=prd_tb.objects.filter(name=cname)
		if check:
			return render(request,'admin/inputs.html',{'error':'Already Data Saved'})
		else:
		    add=prd_tb(name=cname,price=cprice,desc=cdesc,image=cimage,gender=cgender,category=ccategory)
		    add.save()
		    return render(request,'admin/index.html',{'success':"Successfully Data Saved"})
	else:
		return render(request,'admin/inputs.html')

def admin_login(request):
	if request.method == "POST":
		cname=request.POST['Username']
		cpassword=request.POST['Password']
		check=User.objects.filter(username=cname,password=cpassword)
		if check:
			for x in check:
				request.session['id1']=x.id
				request.session['name1']=x.username
			return render(request,'admin/index.html',{'success':"Successfully logined"})
		else:
			return render(request,'admin/login.html',{"error":"invalid details"})

	else:
		return render(request,'admin/login.html')

# def admin_signup(request):
# 	return render(request,'admin/signup.html')

def admin_tables(request):
	data=prd_tb.objects.all()
	return render(request,'admin/tables.html',{'details':data})


def admin_update(request):
	if request.method == "POST":
		cname=request.POST['name']
		cprice=request.POST['price']
		cdesc=request.POST['desc']
		cgender=request.POST['gender']
		ccategory=request.POST['Category']
		prdid=request.GET['uid']
		imgval=request.POST['imgup']
		if imgval =="yes":

			cimage=request.FILES['image']
			oldrec=prd_tb.objects.filter(id=prdid)
			updrec=prd_tb.objects.get(id=prdid)
			for x in oldrec:
				imgurl=x.image.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('Successfully deleted')
			updrec.image=cimage
			updrec.save()

		add=prd_tb.objects.filter(id=prdid).update(name=cname,price=cprice,desc=cdesc,gender=cgender,category=ccategory)
		return HttpResponseRedirect('/myadmin/admin_tables/')
	else:
		prdid=request.GET['uid']
		data=prd_tb.objects.filter(id=prdid)
		return render(request,'admin/update.html',{'details':data})


def admin_delete(request):
    prdid=request.GET['uidd']
    oldrec=prd_tb.objects.filter(id=prdid)
    for x in oldrec:
    	imgurl=x.image.url
    	pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
    	if os.path.exists(pathtoimage):
    		os.remove(pathtoimage)
    data=prd_tb.objects.filter(id=prdid).delete()
    return HttpResponseRedirect('/myadmin/admin_tables/')




def admin_form1(request):
	data=register_tb.objects.all()
	return render(request,'admin/form1.html',{'details':data})

def ajaxview(request):
	
	uid=request.GET.get('uid')
	user=register_tb.objects.filter(id=uid)
	for x in user:
		name=x.name
		email=x.email
		phone=x.phonenumber
		
	dat={"aa":name,"bb":email,"cc":phone}
	print(dat)
	return JsonResponse(dat)	


#############################################################################################################

def admin_payment_tables(request):
	data=payment_tb.objects.all()
	return render(request,'admin/payment_tables.html',{'details':data})

def admin_order_tables(request):
	data=cart_tb.objects.all()
	return render(request,'admin/order_tables.html',{'details':data})




