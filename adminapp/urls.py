from django.urls import path
from . import views

urlpatterns = [

   
##############################################################################################################################################################
###########################################Admin##############################################################################################################



   path('admin_index/',views.admin_index, ),
   path('admin_inputs/',views.admin_inputs),
   path('',views.admin_login),
   # path('admin_signup/',views.admin_signup),
   path('admin_tables/',views.admin_tables),
   path('admin_update/',views.admin_update),
   path('admin_delete/',views.admin_delete),
   path('admin_payment_tables/',views.admin_payment_tables),
   path('admin_order_tables/',views.admin_order_tables),
   path('admin_form1/',views.admin_form1),
   path('ajaxview/',views.ajaxview),



   ]
