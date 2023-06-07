#/bin/bash

# Source: https://www.fosstechnix.com/install-prometheus-and-grafana-on-kubernetes-using-helm/
# Debug1: https://github.com/prometheus-community/helm-charts/issues/467

kubectl apply -f monitoring-namespace.yml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm search repo prometheus-community

helm install stable prometheus-community/kube-prometheus-stack --namespace monitoring

helm list --namespace monitoring

helm upgrade --install stable prometheus-community/kube-prometheus-stack -f values.yaml --namespace monitoring

helm uninstall stable  --namespace monitoring
