#/bin/bash

istioctl install --set profile=demo -y

# kubectl label namespace default istio-injection=enabled

# Making this installation the default for injection and validation.
# Error: failed to create revision tag: failed to apply tag manifests to cluster: failed applying manifest /var/folders/y5/r4jkd8ms3x32_sql383p82gw0000gn/T/revision-tag-manifest-502709870: Get "https://kubernetes.docker.internal:6443/openapi/v2?timeout=32s": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

# Install export
# export PATH="$PATH:/Users/achrozikin/Documents/development/dicoding/Belajar-Membangun-Arsitektur-Microservices/Proyek-Deploy-Aplikasi-Item-App-dengan-Docker-Compose/a433-microservices/kubernetes/istio/istio-1.18.0/bin"