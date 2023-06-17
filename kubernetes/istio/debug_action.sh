#/bin/bash

# Delete order gateway
kubectl delete Gateway order-gateway -n async
kubectl delete VirtualService order-virtual-service -n async

# Delete rabbitmq gateway and virtual service
kubectl delete Gateway rabbitmq-gateway -n async
kubectl delete VirtualService rabbitmq-virtual-service -n async

# Install gateway and virtual service order
kubectl apply -f order-gateway.yml
kubectl apply -f order-virtual-service.yml

# Install gateway and virtual service rabbitmq
kubectl apply -f rabbitmq-gateway.yml
kubectl apply -f rabbitmq-virtual-service.yml

# Analyze istio apply
istioctl analyze -n async

# Export port and show access port
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"

