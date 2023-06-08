#/bin/bash

# Script untuk mempermudah pengetesan

# Clear all configuration apply
kubectl delete StatefulSet mongo-ss -n karsa
kubectl delete ConfigMap mongo-cm -n karsa
kubectl delete Service mongo-service -n karsa
kubectl delete Secret mongo-secret -n karsa
kubectl delete PersistentVolumeClaim mongo-pvc -n karsa
kubectl delete PersistentVolume mongo-pv -n karsa

# Checking resource
kubectl get StatefulSet -n karsa
kubectl get ConfigMap -n karsa
kubectl get Service -n karsa
kubectl get Secret -n karsa
kubectl get PersistentVolumeClaim -n karsa
kubectl get PersistentVolume -n karsa

# Apply content
# Membuat PV dan PVC untuk storage
kubectl apply -f mongo-pv-pvc.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
# Memperlihatkan konfigurasi yang telah dibuat
kubectl get PersistentVolumeClaim -n karsa
kubectl get PersistentVolume -n karsa
sleep 5

# Membuat secret untuk deployment nanti
kubectl apply -f mongo-secret.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
kubectl get Secret -n karsa
sleep 5

# Membuat configmap untuk deployment nanti
kubectl apply -f mongo-configmap.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
kubectl get ConfigMap -n karsa
sleep 5

# Membuat deployment dengan type statefulset
kubectl apply -f mongo-stateful-set.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
kubectl get StatefulSet -n karsa
sleep 5

# Membuat service untuk statefulset yang telah dibuat
kubectl apply -f mongo-service.yml
# Tunggu 10 detik minimal untuk menunggu kubernetes bekerja
sleep 10
kubectl get Service -n karsa
sleep 5

# Jika butuh debugging mungkin bisa menggunakan ini
# Debuging commands
# kubectl describe
# kubectl get events
# kubectl logs -f
# kubectl exec
# kubectl get pods