# Before pushing to this repo

**Create ConfigMap with Grafana dashboards**

```bash
kubectl create configmap grafana-import-dashboards \
  --from-file=configs/grafana \
  --output yaml \
    > ./manifests/grafana/grafana-import-dashboards-configmap.yaml
```

Adjust `metadata` in that manifest.


**Create ConfigMap with Prometheus config**


```bash
kubectl create configmap prometheus-core \
  --from-file=configs/prometheus \
  --output yaml \
    > ./manifests/prometheus/prometheus-core-configmap.yaml
```

Adjust `metadata` in that manifest.


**Create one single manifest file**

```bash
target="./manifests-all.yaml"
rm "$target"
echo "# Derived from ./manifests" >> "$target"
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done
```
