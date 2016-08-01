# Kubernetes Setup for Prometheus and Grafana

> Work in progress. Please fix me :)

```bash
kubectl create --filename prometheus-configmap.yaml
# kubectl get configmaps
# kubectl delete configmaps/prometheus

kubectl create --filename prometheus-service.yaml
# kubectl get services/prometheus
# minikube service prometheus

kubectl create --filename prometheus-deployment.yaml
# kubectl get --all-namespaces --output wide pods
# kubectl logs prometheus-2556266794-sd260
# kubectl delete pods/prometheus-2556266794-sd260

kubectl create --filename node-exporter-service.yaml
kubectl create --filename node-exporter-daemonset.yaml

kubectl create --filename grafana-service.yaml
# kubectl get services/grafana
# minikube service grafana

kubectl create --filename grafana-deployment.yaml
# kubectl get --all-namespaces --output wide pods
```

See grafana.net for some example [dashboards](https://grafana.net/dashboards) and [plugins](https://grafana.net/plugins).

- Configure [Prometheus](https://grafana.net/plugins/prometheus) data source for Grafana.<br/>
`Grafana UI / Data Sources / Add data source`
  - `Name`: `prometheus`
  - `Type`: `Prometheus`
  - `Url`: `http://prometheus:9090`
  - `Add`

- Import [Prometheus Stats](https://grafana.net/dashboards/2):<br/>
  `Grafana UI / Dashboards / Import`
  - `Grafana.net Dashboard`: `https://grafana.net/dashboards/2`
  - `Load`
  - `Prometheus`: `prometheus`
  - `Save & Open`

- Import [Kubernetes cluster monitoring](https://grafana.net/dashboards/162):<br/>
  `Grafana UI / Dashboards / Import`
  - `Grafana.net Dashboard`: `https://grafana.net/dashboards/162`
  - `Load`
  - `Prometheus`: `prometheus`
  - `Save & Open`
