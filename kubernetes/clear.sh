#/bin/bash

# Uninstall order
kubectl delete Deployment order-deployment -n async
kubectl delete Service order-service -n async

# Uinstall shipping
kubectl delete Deployment shipping-deployment -n async
kubectl delete Service shipping-service -n async

# Uninstall rabbitmq
helm uninstall rabbitmq -n async

# Delete namespace
# kubectl delete Namespace async