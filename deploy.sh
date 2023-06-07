#/bin/bash

# Installing namepace for grouping the resource
kubectl apply -f karsa-namespace.yml

# Get created namespace list
kubectl get namespace


# Install MongoDB
# kubectl apply -f mongo-pv-pvc.yml
# sleep 10
cd mongodb
kubectl apply -f mongo-secret.yml
sleep 10
kubectl apply -f mongo-configmap.yml
sleep 10
kubectl apply -f mongo-service.yml
sleep 10
kubectl apply -f mongo-stateful-set.yml
sleep 10
cd ..

# Install Backend
cd backend
kubectl apply -f karsajobs-deployment.yml
sleep 10
kubectl apply -f karsajobs-service.yml
sleep 10
cd ..

# Install Frontend
cd frontend
kubectl apply -f karsajobs-ui-deployment.yml
sleep 10
kubectl get Deployment -n karsa
sleep 5

kubectl apply -f karsajobs-ui-service.yml
sleep 10
kubectl get Service -n karsa
sleep 5
cd ..
