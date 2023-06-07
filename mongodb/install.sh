#/bin/bash

# Install secret
kubectl apply -f mongo-secret.yml

# Install PV and PVC
kubectl apply -f mongo-pv-pvc.yml

# Install Service
kubectl apply -f mongo-service.yml

# Install Statefultset
kubectl apply -f mongo-stateful-set.yml

# Show pods

# Debuging commands
# kubectl describe
# kubectl get events
# kubectl logs -f
# kubectl exec