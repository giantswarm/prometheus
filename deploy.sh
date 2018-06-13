#!/bin/sh

NAMESPACE="monitoring"

sed -i "s/\$NAMESPACE/monitoring/g" ./configs/prometheus/prometheus.yaml
sed -i "s/\$NAMESPACE/monitoring/g" ./manifests/grafana/import-dashboards/job.yaml
sed -i "s/\$NAMESPACE/monitoring/g" ./manifests/prometheus/rbac.yaml

./build.sh

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml
