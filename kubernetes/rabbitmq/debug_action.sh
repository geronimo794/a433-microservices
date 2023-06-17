#/bin/bash

# If error stop
set -e

# Install PV and PVC
kubectl apply -f rabbitmq-pv-pvc.yaml

# Install secret for shared password
kubectl apply -f rabbitmq-secret.yaml

# Install rabbitmq
helm install rabbitmq \
	oci://registry-1.docker.io/bitnamicharts/rabbitmq \
	-n async \
	-f values.yaml \


# Update service to create convention istio
kubectl apply -f rabbitmq-headless-service.yaml
kubectl apply -f rabbitmq-service.yaml

# Uninstall rabbitmq
# helm uninstall rabbitmq -n async

# Install local expose rabbitmq
# kubectl apply -f rabbitmq-local-service.yaml

# Or you can use port forward
# kubectl port-forward --namespace async svc/rabbitmq 15672:15672

# Get credential
# echo "Username      : admin"
# echo "Password      : $(kubectl get secret --namespace async rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d)"
# echo "ErLang Cookie : $(kubectl get secret --namespace async rabbitmq -o jsonpath="{.data.rabbitmq-erlang-cookie}" | base64 -d)"
# Saved password: 9iSvqNLFiZNvAzZW

# Edit applied configuration via vim cli
# kubectl edit svc rabbitmq -n async