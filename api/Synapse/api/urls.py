# urls.py
from django.urls import path
from .views import predict  # Pastikan sudah mengimpor fungsi predict dari views

urlpatterns = [
    path('predict/', predict, name='predict'),  # Endpoint predict
]
