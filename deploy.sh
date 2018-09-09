#!/bin/sh

# Create ConfigMap for an external url
kubectl create configmap --dry-run alertmanager-templates \
  --from-file=configs/alertmanager-templates \
  --output yaml \
    > ./manifests/alertmanager/alertmanager-templates.yaml

# Create ConfigMap with Grafana dashboards and datasources
kubectl create configmap --dry-run grafana-import-dashboards \
  --from-file=configs/grafana \
  --output yaml \
    > ./manifests/grafana/import-dashboards/configmap.yaml

# Create ConfigMap with Prometheus config
kubectl create configmap --dry-run prometheus-core \
  --from-file=configs/prometheus \
  --output yaml \
    > ./manifests/prometheus/configmap.yaml

# Create one single manifest file
target="./manifests-all.yaml"
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done

# replace env variables in manifest file
source ./.env
for line in `cat .env` ; do
  var=$(echo -n $line   | awk 'BEGIN {FS="="} {print $1}')
  value=$(echo -n $line | awk 'BEGIN {FS="="} {print $2}')
  sed -i "s#\$$var#$value#g" ./manifests-all.yaml
done

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml

rm $target
