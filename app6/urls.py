from django.urls import path
from . import views

urlpatterns = [
   path('',views.index),
   path('checkout/',views.checkout),
   path('codes/',views.codes),
   path('login/',views.login),
   path('logout/',views.logout),
   path('mail/',views.mail),
   path('products/',views.products),
   path('products1/',views.products1),
   path('registered/',views.registered),
   path('single/',views.single),
   path('addcart/',views.addcart),
   path('updatecart/',views.updatecart),
   path('removecart/',views.removecart),
   path('downloadpdf/',views.downloadpdf),

   #######################################################################################################

   path('payment_index/',views.payment_index),

   
##############################################################################################################################################################
###########################################Admin##############################################################################################################



   # path('admin_index/',views.admin_index),
   # path('admin_inputs/',views.admin_inputs),
   # path('admin_login/',views.admin_login),
   # # path('admin_signup/',views.admin_signup),
   # path('admin_tables/',views.admin_tables),


   ]
