#/bin/bash

# Install namespace
# kubectl apply -f async-namespace.yml

# Install rabbitmq
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n async

# Install order
kubectl apply -f order/order-service.yml
kubectl apply -f order/order-deployment.yml

# Install shipping
kubectl apply -f order/order-service.yml
kubectl apply -f order/order-deployment.yml

# Delete namespace
# kubectl delete Namespace async