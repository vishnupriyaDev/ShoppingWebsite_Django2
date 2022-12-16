from django.db import models

# Create your models here.
class register_tb(models.Model):
	name=models.CharField(max_length=225)
	email=models.CharField(max_length=225)
	phonenumber=models.CharField(max_length=225)
	password=models.CharField(max_length=225)

class prd_tb(models.Model):
	name=models.CharField(max_length=225)
	price=models.CharField(max_length=225)
	desc=models.TextField()
	image=models.ImageField(upload_to="product/")
	gender=models.CharField(max_length=225)
	category=models.CharField(max_length=225)

class cart_tb(models.Model):
	pid=models.ForeignKey(prd_tb, on_delete=models.CASCADE)
	uid=models.ForeignKey(register_tb, on_delete=models.CASCADE)
	image=models.ImageField(upload_to="product/")
	totalamount=models.CharField(max_length=225)
	quantity=models.CharField(max_length=225,default="1")
	status=models.CharField(max_length=225,default="pending")

class payment_tb(models.Model):
	uid=models.ForeignKey(register_tb, on_delete=models.CASCADE)
	# image=models.ImageField(upload_to="product/")
	status=models.CharField(max_length=225)
	total=models.CharField(max_length=225)
	date=models.DateField()
	time=models.TimeField()
