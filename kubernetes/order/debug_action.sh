#/bin/bash

# Install local expose rabbitmq
# kubectl apply -f order-deployment.yml

# Uninstall deployment
# kubectl delete Deployment order-deployment -n async


# Delete service node port
kubectl delete service order-service -n async

# Sleep for a while
sleep 5s

# Install service via nodeport
kubectl apply -f order-service.yml
