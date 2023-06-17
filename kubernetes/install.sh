#/bin/bash

# If error command will stop exit
set -e

##########################
# Install NAMESPACE
##########################
kubectl apply -f async-namespace.yml
sleep 5

##########################
# Install ISTIO
##########################
# curl -L https://istio.io/downloadIstio | sh -

# Add istio path to path variable
export PATH="$PATH:/Users/achrozikin/Documents/development/dicoding/Belajar-Membangun-Arsitektur-Microservices/Proyek-Deploy-Aplikasi-Item-App-dengan-Docker-Compose/a433-microservices/kubernetes/istio/istio-1.18.0/bin"

# Set profile installation istio
istioctl install --set profile=demo -y
sleep 10

# Istio will create data plane to the namespace
kubectl label namespace async istio-injection=enabled
sleep 5

##########################
# Install RABBITMQ
##########################
cd rabbitmq

# Install PV and PVC
kubectl apply -f rabbitmq-pv-pvc.yml
sleep 10

# Install secret for shared password
kubectl apply -f rabbitmq-secret.yml
sleep 10

# Install rabbitmq
helm install rabbitmq \
	oci://registry-1.docker.io/bitnamicharts/rabbitmq \
	-n async \
	-f values.yml
sleep 10
cd ..

##########################
# Install ORDER SERVICE
##########################
# Install order
kubectl apply -f order/order-service.yml
sleep 5
kubectl apply -f order/order-deployment.yml
sleep 5

##########################
# Install SHIPPING SERVICE
##########################
# Install shipping
kubectl apply -f shipping/shipping-service.yml
sleep 5
kubectl apply -f shipping/shipping-deployment.yml
sleep 5

##########################
# Install ISTIO GATEWAY AND VIRTUAL SERVICE
##########################
# Reapply service for rabbitmq to match istio convient
kubectl apply -f rabbitmq/rabbitmq-service.yml
sleep 5
kubectl apply -f rabbitmq/rabbitmq-headless-service.yml
sleep 5

# Install gateway and virtual service order
kubectl apply -f istio/order-gateway.yml
sleep 5
kubectl apply -f istio/order-virtual-service.yml
sleep 5

# Install gateway and virtual service rabbitmq
kubectl apply -f istio/rabbitmq-gateway.yml
sleep 5
kubectl apply -f istio/rabbitmq-virtual-service.yml
sleep 5

# Analyze istio apply
istioctl analyze -n async
sleep 5

# Export port and show access port
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"

# IF your using Kubernetes with Docker, you can access
# http://localhost/ to access rabbitmq dashboard
# http://localhost:31400/order to make order request