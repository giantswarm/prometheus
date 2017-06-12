# Before pushing to this repo

Create derived `ConfigMap`s and `manifests-all.yaml` by running the following commands or executing `build.sh`:

```bash
# Create ConfigMap with prometheus rules for alerting
kubectl --namespace monitoring create configmap --dry-run prometheus-rules \
  --from-file=configs/prometheus/rules \
  --output yaml \
    > ./manifests/prometheus/prometheus-rules.yaml
# Workaround since `--namespace monitoring` from above is not preserved
echo "  namespace: monitoring" >> ./manifests/prometheus/prometheus-rules.yaml

# Create ConfigMap for an external url
kubectl --namespace monitoring create configmap --dry-run alertmanager-templates \
  --from-file=configs/alertmanager-templates \
  --output yaml \
    > ./manifests/alertmanager/alertmanager-templates.yaml
# Workaround since `--namespace monitoring` from above is not preserved
echo "  namespace: monitoring" >> ./manifests/alertmanager/alertmanager-templates.yaml

# Create ConfigMap with Grafana dashboards and datasources
kubectl --namespace monitoring create configmap --dry-run grafana-import-dashboards \
  --from-file=configs/grafana \
  --output yaml \
    > ./manifests/grafana/import-dashboards/configmap.yaml
# Workaround since `--namespace monitoring` from above is not preserved
echo "  namespace: monitoring" >> ./manifests/grafana/import-dashboards/configmap.yaml

# Create ConfigMap with Prometheus config
kubectl --namespace monitoring create configmap --dry-run prometheus-core \
  --from-file=configs/prometheus/prometheus.yaml \
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
