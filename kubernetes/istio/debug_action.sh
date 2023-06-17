#/bin/bash

# istioctl install --set profile=demo -y

# kubectl label namespace default istio-injection=enabled

# Making this installation the default for injection and validation.
# Error: failed to create revision tag: failed to apply tag manifests to cluster: failed applying manifest /var/folders/y5/r4jkd8ms3x32_sql383p82gw0000gn/T/revision-tag-manifest-502709870: Get "https://kubernetes.docker.internal:6443/openapi/v2?timeout=32s": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

# Install export
# export PATH="$PATH:/Users/achrozikin/Documents/development/dicoding/Belajar-Membangun-Arsitektur-Microservices/Proyek-Deploy-Aplikasi-Item-App-dengan-Docker-Compose/a433-microservices/kubernetes/istio/istio-1.18.0/bin"

# Inject namespace for istion
# kubectl label namespace async istio-injection=enabled

# Delete order gateway
# kubectl delete Gateway order-gateway -n async
# kubectl delete VirtualService order-virtual-service -n async

# Install gateway to make external access
# kubectl apply -f order-gateway.yml

# Analyze istio apply
# istioctl analyze -n async

# Export port
# export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
# export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
# export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
# echo "$GATEWAY_URL"


# Install Gateway and Virtual Service
kubectl apply -f rabbitmq-gateway.yml
kubectl apply -f rabbitmq-virtual-service.yml
istioctl analyze -n async



