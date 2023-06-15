#/bin/bash

# Install rabbitmq
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n async

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