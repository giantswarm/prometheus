> Kubernetes compose orchestra for Prometheus、Grafana、AlertManager

## Quick Start
* `kubectl label nodes your-desired-node monitoringnode=true`
* `cp -a .env.example .env` and update it (avoid the # char1)
* `./deploy.sh`

## Reimport grafana dashboad
```bash
kubectl -n $NAMESPACE delete job grafana-import-dashboards
kubectl -n $NAMESPACE apply -f ./manifests/grafana/import-dashboards/job.yaml
```

## Reference
* https://github.com/giantswarm/kubernetes-prometheus
* https://github.com/kayrus/prometheus-kubernetes
* https://github.com/kubernetes/charts/tree/master/stable/prometheus
* https://github.com/rancher/community-catalog/tree/master/kubernetes-templates/Prometheus
