#/bin/bash

# Clear all apply
kubectl delete StatefulSet mongodb-stateful-set -n karsa
kubectl delete ConfigMap mongo-config-map -n karsa
kubectl delete Service mongodb-service -n karsa
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
kubectl apply -f mongo-secret.yml
kubectl apply -f mongo-configmap.yml
kubectl apply -f mongo-service.yml
kubectl apply -f mongo-stateful-set.yml

# kubectl apply -f mongo-configmap.yml
# kubectl apply -f mongo-stateful-set.yml

# # Install PV and PVC
# kubectl apply -f mongo-pv-pvc.yml

# # Install Service
# kubectl apply -f mongo-service.yml

# # Install Statefultset
# kubectl apply -f mongo-stateful-set.yml

# # Show pods

# # Debuging commands
# # kubectl describe
# # kubectl get events
# # kubectl logs -f
# # kubectl exec