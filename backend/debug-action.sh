#/bin/bash

# Clear all apply
kubectl delete Deployment backend-deployment -n karsa
kubectl delete Service backend-service -n karsa

# Checking resource
kubectl get Deployment -n karsa
kubectl get Service -n karsa

# Apply content
kubectl apply -f karsajobs-deployment.yml
sleep 10
kubectl get Deployment -n karsa
sleep 5

kubectl apply -f karsajobs-service.yml
sleep 10
kubectl get Service -n karsa
sleep 5

# Debuging commands
# kubectl describe
# kubectl get events
# kubectl logs -f
# kubectl exec
# kubectl get pods