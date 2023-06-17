#/bin/bash

# If error command will stop exit
set -e

##########################
# Install NAMESPACE
##########################
kubectl apply -f async-namespace.yml

##########################
# Install ISTIO
##########################
# curl -L https://istio.io/downloadIstio | sh -

# Add istio path to path variable
export PATH="$PATH:/Users/achrozikin/Documents/development/dicoding/Belajar-Membangun-Arsitektur-Microservices/Proyek-Deploy-Aplikasi-Item-App-dengan-Docker-Compose/a433-microservices/kubernetes/istio/istio-1.18.0/bin"

# Set profile installation istio
istioctl install --set profile=demo -y

# Istio will create data plane to the namespace
kubectl label namespace async istio-injection=enabled

##########################
# Install RABBITMQ
##########################
cd rabbitmq

# Install PV and PVC
kubectl apply -f rabbitmq-pv-pvc.yaml

# Install secret for shared password
kubectl apply -f rabbitmq-secret.yaml

# Install rabbitmq
helm install rabbitmq \
	oci://registry-1.docker.io/bitnamicharts/rabbitmq \
	-n async \
	-f values.yaml
sleep 10s
cd ..

##########################
# Install ORDER SERVICE
##########################
# Install order
kubectl apply -f order/order-service.yml
kubectl apply -f order/order-deployment.yml

##########################
# Install SHIPPING SERVICE
##########################
# Install shipping
kubectl apply -f shipping/shipping-service.yml
kubectl apply -f shipping/shipping-deployment.yml


##########################
# Install ISTIO GATEWAY AND VIRTUAL SERVICE
##########################
# Reapply service for rabbitmq to match istio convient
kubectl apply -f rabbitmq/rabbitmq-service.yaml
kubectl apply -f rabbitmq/rabbitmq-headless-service.yaml

# Install gateway and virtual service order
kubectl apply -f istio/order-gateway.yml
kubectl apply -f istio/order-virtual-service.yml

# Install gateway and virtual service rabbitmq
kubectl apply -f istio/rabbitmq-gateway.yml
kubectl apply -f istio/rabbitmq-virtual-service.yml

# Analyze istio apply
istioctl analyze -n async

# Export port and show access port
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"