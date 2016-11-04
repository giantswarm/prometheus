# Before pushing to this repo

Create derived `ConfigMap`s and `manifests-all.yaml`:

```bash
# Create ConfigMap with Grafana dashboards and datasources
kubectl --namespace monitoring create configmap --dry-run grafana-import-dashboards \
  --from-file=configs/grafana \
  --output yaml \
    > ./manifests/grafana/import-dashboards/configmap.yaml
# Workaround since `--namespace monitoring` from above is not preserved
echo "  namespace: monitoring" >> ./manifests/grafana/import-dashboards/configmap.yaml

# Create ConfigMap with Prometheus config
kubectl --namespace monitoring create configmap --dry-run prometheus-core \
  --from-file=configs/prometheus \
  --output yaml \
    > ./manifests/prometheus/configmap.yaml
# Workaround since `--namespace monitoring` from above is not preserved
echo "  namespace: monitoring" >> ./manifests/prometheus/configmap.yaml

# Create one single manifest file
target="./manifests-all.yaml"
rm "$target"
echo "# Derived from ./manifests" >> "$target"
for file in $(find ./manifests -type f -name "*.yaml" | sort) ; do
  echo "---" >> "$target"
  cat "$file" >> "$target"
done
```
