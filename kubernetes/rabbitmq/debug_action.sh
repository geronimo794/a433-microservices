#/bin/bash

helm install rabbitmq \
	--set auth.username=admin,auth.password=secretpassword \
	oci://registry-1.docker.io/bitnamicharts/rabbitmq \
	-n async

# # Uninstall
# helm uninstall rabbitmq -n async

# # Install local expose rabbitmq
# kubectl apply -f rabbitmq-local-service.yaml

# Or you can use port forward
# kubectl port-forward --namespace async svc/rabbitmq 15672:15672
