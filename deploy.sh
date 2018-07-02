#!/bin/sh

# 根据实际情况修改以下环境变量配置
NAMESPACE=monitoring
PROMETHEUS_URL=prometheus.monitoring.yoursite.com
GRAFANA_URL=grafana.monitoring.yoursite.com
ALERTMANAGER_URL=alertmanager.monitoring.yoursite.com
ALERT_TO=develops@yoursite.com
ALERT_FROM=mornitoring@yoursite.com
SMTP_HOST=smtp.qq.com:587
SMTP_USER=mornitoring@yoursite.com
SMTP_PASSWORD=yourpassword
ALERT_WEBHOOK=http://webhook.yoursite.com
WECHAT_CORP_ID=企业微信账号ID
WECHAT_AGENT_ID=企业微信应用ID
WECHAT_API_SECRET=企业微信应用秘钥
WECHAT_TO_USER=develops
WECHAT_TO_PARTY=develops
WECHAT_TO_TAG=develops

./build.sh
sed -i "s/\$NAMESPACE/$NAMESPACE/g" ./manifests-all.yaml
sed -i "s/\$PROMETHEUS_URL/$PROMETHEUS_URL/g" ./manifests-all.yaml
sed -i "s/\$GRAFANA_URL/$GRAFANA_URL/g" ./manifests-all.yaml
sed -i "s/\$ALERTMANAGER_URL/$ALERTMANAGER_URL/g" ./manifests-all.yaml
sed -i "s/\$ALERT_TO/$ALERT_TO/g" ./manifests-all.yaml
sed -i "s/\$ALERT_FROM/$ALERT_FROM/g" ./manifests-all.yaml
sed -i "s/\$SMTP_HOST/$SMTP_HOST/g" ./manifests-all.yaml
sed -i "s/\$SMTP_USER/$SMTP_USER/g" ./manifests-all.yaml
sed -i "s/\$SMTP_PASSWORD/$SMTP_PASSWORD/g" ./manifests-all.yaml
sed -i "s/\$ALERT_WEBHOOK/$ALERT_WEBHOOK/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_CORP_ID/$WECHAT_CORP_ID/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_AGENT_ID/$WECHAT_AGENT_ID/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_API_SECRET/$WECHAT_API_SECRET/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_TO_USER/$WECHAT_TO_USER/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_TO_PARTY/$WECHAT_TO_PARTY/g" ./manifests-all.yaml
sed -i "s/\$WECHAT_TO_TAG/$WECHAT_TO_TAG/g" ./manifests-all.yaml

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f ./manifests-all.yaml
