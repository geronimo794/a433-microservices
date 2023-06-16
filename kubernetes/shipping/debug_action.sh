#/bin/bash

# Install local expose rabbitmq
kubectl apply -f shipping-deployment.yml

# Uninstall deployment
# kubectl delete Deployment shipping-deployment -n async


# Delete service node port
# kubectl delete service shipping-service -n async

# Sleep for a while
# sleep 5s

# Install service via nodeport
# kubectl apply -f shipping-service.yml
