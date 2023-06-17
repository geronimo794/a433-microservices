#/bin/bash

# Uninstall rabbitmq
helm uninstall rabbitmq -n async

# Unistall pv and pvc
kubectl delete PersistentVolume rabbitmq-pv
kubectl delete PersistentVolumeClaim rabbitmq-pvc -n async
