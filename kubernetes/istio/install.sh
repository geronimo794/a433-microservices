#/bin/bash

# Download istio release
curl -L https://istio.io/downloadIstio | sh -

# Add istio path to path variable
export PATH="$PATH:/Users/achrozikin/Documents/development/dicoding/Belajar-Membangun-Arsitektur-Microservices/Proyek-Deploy-Aplikasi-Item-App-dengan-Docker-Compose/a433-microservices/kubernetes/istio/istio-1.18.0/bin"

# Set profile installation istio
istioctl install --set profile=demo -y

# Istio will create data plane to the namespace
kubectl label namespace async istio-injection=enabled