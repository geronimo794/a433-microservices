#/bin/bash

# Script untuk mempermudah pengetesan

# Clear all apply
kubectl delete Deployment frontend-deployment -n karsa
kubectl delete Service frontend-service -n karsa

# Checking resource
kubectl get Deployment -n karsa
kubectl get Service -n karsa

# Apply content
# Membuat deployment
kubectl apply -f karsajobs-ui-deployment.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
# Memperlihatkan konfigurasi yang telah dibuat
kubectl get Deployment -n karsa
sleep 5

# Membuat service agar deployment dapat diakses
kubectl apply -f karsajobs-ui-service.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
# Memperlihatkan konfigurasi yang telah dibuat
kubectl get Service -n karsa
sleep 5

# Debuging commands
# kubectl describe
# kubectl get events
# kubectl logs -f
# kubectl exec
# kubectl get pods