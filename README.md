# Kubernetes Setup for Prometheus、Grafana、AlertManager

## Quick Start
* 指定监控组件部署节点，打标签monitoringnode=true
* 部署节点/data目录增加完全写入权限
* 调整部署脚本内的变量配置并部署服务： `./deploy.sh`
* 下线服务 `kubectl delete namespace $NAMESPACE`


## 重新导入仪表盘
```bash
kubectl -n $NAMESPACE delete job grafana-import-dashboards
kubectl -n $NAMESPACE apply -f ./manifests/grafana/import-dashboards/job.yaml
```

## 参考项目
* https://github.com/giantswarm/kubernetes-prometheus
* https://github.com/kayrus/prometheus-kubernetes
* https://github.com/kubernetes/charts/tree/master/stable/prometheus
* https://github.com/rancher/community-catalog/tree/master/kubernetes-templates/Prometheus