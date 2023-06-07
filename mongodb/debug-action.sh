#/bin/bash

# Clear all apply
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
kubectl apply -f mongo-pv-pvc.yml
sleep 10
kubectl apply -f mongo-secret.yml
sleep 10
kubectl apply -f mongo-configmap.yml
sleep 10
kubectl apply -f mongo-service.yml
sleep 10
kubectl apply -f mongo-stateful-set.yml

# # Show pods

# # Debuging commands
# # kubectl describe
# # kubectl get events
# # kubectl logs -f
# # kubectl exec