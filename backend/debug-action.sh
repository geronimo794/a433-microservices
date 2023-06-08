#/bin/bash

# Script untuk mempermudah pengetesan

# Clear all configuration apply
kubectl delete Deployment backend-deployment -n karsa
kubectl delete Service backend-service -n karsa

# Checking resource
kubectl get Deployment -n karsa
kubectl get Service -n karsa

# Apply content
# Membuat deployment
kubectl apply -f karsajobs-deployment.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
# Memperlihatkan konfigurasi yang telah dibuat
kubectl get Deployment -n karsa
sleep 5

# Membuat service agar deployment dapat diakses
kubectl apply -f karsajobs-service.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
# Memperlihatkan konfigurasi yang telah dibuat
kubectl get Service -n karsa
sleep 5

# Jika butuh debugging mungkin bisa menggunakan ini
# Debuging commands
# kubectl describe
# kubectl get events
# kubectl logs -f
# kubectl exec
# kubectl get pods