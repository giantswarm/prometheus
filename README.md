# Kubernetes Setup for Prometheus and Grafana

## Quick Start
* 指定监控组件部署节点，打标签monitoringnode=true
* 部署节点/data目录增加完全写入权限
* manifests/alertmanager/configmap.yaml调整receivers配置
* manifests/ingress.yaml 调整入口域名
* 启动服务： `./deploy.sh`
* 下线服务 `kubectl delete namespace $NAMESPACE`


## 重新导入仪表盘
```bash
kubectl -n $NAMESPACE delete job grafana-import-dashboards
kubectl -n $NAMESPACE apply -f ./manifests/grafana/import-dashboards/job.yaml
```
