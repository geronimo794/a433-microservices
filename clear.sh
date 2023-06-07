#/bin/bash

# Delete front end
kubectl delete Deployment frontend-deployment -n karsa
sleep 5
kubectl delete Service frontend-service -n karsa
sleep 5

# Delete back end
kubectl delete Deployment backend-deployment -n karsa
sleep 5
kubectl delete Service backend-service -n karsa
sleep 5

# Delete database
kubectl delete StatefulSet mongo-ss -n karsa
sleep 5
kubectl delete ConfigMap mongo-cm -n karsa
sleep 5
kubectl delete Service mongo-service -n karsa
sleep 5
kubectl delete Secret mongo-secret -n karsa
sleep 5

# NO NEED DELETE PC IT TAKES TIME
# kubectl delete PersistentVolumeClaim mongo-pvc -n karsa
# sleep 5
# kubectl delete PersistentVolume mongo-pv -n karsa
# sleep 5

# DELETE NAME SPACE
# kubectl delete ns karsa

