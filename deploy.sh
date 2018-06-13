#!/bin/sh

NAMESPACE="monitoring"

sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./configs/prometheus/prometheus.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./manifests/grafana/import-dashboards/job.yaml
sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./manifests/prometheus/rbac.yaml

./build.sh

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml
