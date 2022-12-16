from django.shortcuts import render
from django.http import HttpResponseRedirect,HttpResponse
from adminapp.models import *
from app6.models import *
import datetime
# from django.contrib.auth.models import User

# Create your views here.
def index(request):
	data=prd_tb.objects.all()
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	return render(request,'index.html',{"data":data,"cat":category})
	

def checkout(request):
	if request.session.has_key("myid"):
		uid=request.session['myid']
		category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
		uidd=register_tb.objects.get(id=uid)
		cart=cart_tb.objects.filter(uid=uidd,status="pending")
		total=0
		for x in cart:
		  price=x.totalamount
		  total=float(price)+total	
		return render(request,'checkout.html',{"cart":cart,"total":total,"cat":category})
	else:
		return render(request,'login.html')

def codes(request):
	data=prd_tb.objects.all()
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	return render(request,'codes.html',{"data":data,"cat":category})

def login(request):
    if request.method == "POST":
    	cemail=request.POST['Email']
    	cpassword=request.POST['Confirm Password']
    	check=register_tb.objects.filter(email=cemail,password=cpassword)
    	if check:
    		for x in check:
    			request.session['myid']=x.id
    			request.session['myname']=x.name
    			data=prd_tb.objects.all()
    			category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
    			return render(request,'index.html',{'success':"Successfully logined","data":data,"cat":category})
    	else:
    		return render(request,'login.html',{'error':'invalid details'})
    else:
    	return render(request,'login.html')

def logout(request):
	if request.session.has_key("myid"):
		del request.session['myid']
		del request.session['myname']
	return HttpResponseRedirect('/')

	
def mail(request):
	data=prd_tb.objects.all()
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	return render(request,'mail.html',{"data":data,"cat":category})

def products(request):
	
	gd=request.GET["gd"]
	ct=request.GET["ct"]
	data=prd_tb.objects.all()
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	data1=prd_tb.objects.filter(gender=gd,category=ct)
	content={"datakey":data1,"data":data,"category":ct,"cat":category,"gender":gd}

	return render(request,'products.html',content)
	

def products1(request):
	data=prd_tb.objects.all()
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	return render(request,'products1.html',{"data":data,"cat":category})

def registered(request):
	if request.method == "POST":
		cname=request.POST['Username']
		cemail=request.POST['Email']
		cphonenumber=request.POST['phone']
		cpassword=request.POST['Confirm Password']
		check=register_tb.objects.filter(email=cemail)
		if check:
			return render(request,'registered.html',{'error':'Already registered'})
		else:
		    add=register_tb(name=cname,email=cemail,phonenumber=cphonenumber,password=cpassword,)
		    add.save()
		    return render(request,'registered.html',{'success':"Successfully registered"})
	else:
		return render(request,'registered.html')

def single(request):
	if request.session.has_key("myid"):
		prdid=request.GET['pid']
		data=prd_tb.objects.filter(id=prdid)
		category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
		return render(request,'single.html',{"data":data,"cat":category})
	else:
		return HttpResponseRedirect('/login/')



def addcart(request):
	category=prd_tb.objects.raw('SELECT * FROM app6_prd_tb GROUP BY category')
	if request.method == "POST":
		pid=request.GET['pid']
		prdid=prd_tb.objects.get(id=pid)
		uid=request.session['myid']
		uidd=register_tb.objects.get(id=uid)
		product=prd_tb.objects.filter(id=pid)
		check=cart_tb.objects.filter(pid=prdid,uid=uidd,status="pending")			
		total=0
		for x in product:
			price=x.price
		delv=(int(price)*10)/100
		total=delv+int(price)
		if check:
			cart=cart_tb.objects.filter(uid=uidd,status="pending")
			total=0
			for x in cart:
				price=x.totalamount
				total=float(price)+total		
			return render(request,'checkout.html',{"cart":cart,'error':'Already Saved',"total":total,"cat":category})
		else:
			add=cart_tb(pid=prdid,uid=uidd,totalamount=total)
			add.save()
			cart=cart_tb.objects.filter(uid=uidd,status="pending")
			total=0
			for x in cart:
				price=x.totalamount
				total=float(price)+total		
			return render(request,"checkout.html",{"cart":cart,"total":total,"cat":category})
	else:
		prdid=request.GET['pid']
		data=prd_tb.objects.filter(id=prdid)		
		return render(request,'single.html',{"data":data,"cat":category})

def updatecart(request):
	cid=request.GET['cid']
	qty=request.POST['qty']
	data=cart_tb.objects.filter(id=cid)
	for x in data:
		price=x.pid.price
	delv=(int(price)*10)/100
	newprice=(int(qty)*int(price)+float(delv))
	cart_tb.objects.filter(id=cid).update(totalamount=newprice,quantity=qty)
	return HttpResponseRedirect("/checkout/")


def removecart(request):
	cid=request.GET['cid']
	cart_tb.objects.filter(id=cid).delete()
	return HttpResponseRedirect("/checkout/")

from reportlab.pdfgen import canvas 
from django.views.generic import View
from project6.utils import render_to_pdf


def downloadpdf(request):
	pid=request.GET['pid']
	data=payment_tb.objects.filter(id=pid)
	pdf=render_to_pdf('pdfdownlod.html',{'data':data})
	return HttpResponse(pdf,content_type='application/pdf')


###############################################################################################################


def payment_index(request):
	if request.method == "POST":
		uid=request.session['myid']
		uidd=register_tb.objects.get(id=uid)
		cdate=datetime.datetime.now().date()
		ctime=datetime.datetime.now().time()
		total=request.POST['total']
		add=payment_tb(uid=uidd,status="paid",total=total,date=cdate,time=ctime)
		add.save()
		cart_tb.objects.filter(uid=uidd,status="pending").update(status="paid")
		return HttpResponseRedirect("/")
	else:
		total=request.GET['gt']
	return render(request,'payment/index.html',{"total":total})

	
##########################################################################################################################################
################################################Admin#####################################################################################


# def admin_index(request):
# 	return render(request,'admin/index.html')

# def admin_inputs(request):
# 	return render(request,'admin/inputs.html')

# def admin_login(request):
# 	if request.method == "POST":
# 		cname=request.POST['Username']
# 		cpassword=request.POST['Password']
# 		check=User.objects.filter(username=cname,password=cpassword)
# 		if check:
# 			for x in check:
# 				request.session['id1']=x.id
# 				request.session['name1']=x.username
# 			return render(request,'admin/index.html',{'success':"Successfully logined"})
# 		else:
# 			return render(request,'admin/login.html',{"error":"invalid details"})

# 	else:
# 		return render(request,'admin/login.html')

# # def admin_signup(request):
# # 	return render(request,'admin/signup.html')

# def admin_tables(request):
# 	return render(request,'admin/table.html')





