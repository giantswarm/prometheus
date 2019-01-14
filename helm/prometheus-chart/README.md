# Prometheus

An opinionated [Prometheus](https://prometheus.io/) Helm chart for deployment in Giant Swarm clusters.

## Prerequisites

- Kubernetes 1.3+ with Beta APIs enabled
- [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart:

```console
$ helm install ./helm --name my-prometheus
```

The command deploys Prometheus on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the deployment:

```console
$ helm delete my-prometheus --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Prometheus chart and their default values.

Parameter | Description | Default
--------- | ----------- | -------
`alertmanager.enabled` | If true, create alertmanager | `true`
`alertmanager.name` | alertmanager container name | `alertmanager`
`alertmanager.image.repository` | alertmanager container image repository | `prom/alertmanager`
`alertmanager.image.tag` | alertmanager container image tag | `v0.15.2`
`alertmanager.image.pullPolicy` | alertmanager container image pull policy | `IfNotPresent`
`alertmanager.prefixURL` | The prefix slug at which the server can be accessed | ``
`alertmanager.baseURL` | The external url at which the server can be accessed | `/`
`alertmanager.extraArgs` | Additional alertmanager container arguments | `{}`
`alertmanager.configMapOverrideName` | Prometheus alertmanager ConfigMap override where full-name is `{{.Release.Name}}-{{.Values.alertmanager.configMapOverrideName}}` and setting this value will prevent the default alertmanager ConfigMap from being generated | `""`
`alertmanager.ingress.enabled` | If true, alertmanager Ingress will be created | `false`
`alertmanager.ingress.annotations` | alertmanager Ingress annotations | `{}`
`alertmanager.ingress.extraLabels` | alertmanager Ingress additional labels | `{}`
`alertmanager.ingress.hosts` | alertmanager Ingress hostnames | `[]`
`alertmanager.ingress.tls` | alertmanager Ingress TLS configuration (YAML) | `[]`
`alertmanager.nodeSelector` | node labels for alertmanager pod assignment | `{}`
`alertmanager.tolerations` | node taints to tolerate (requires Kubernetes >=1.6) | `[]`
`alertmanager.affinity` | pod affinity | `{}`
`alertmanager.schedulerName` | alertmanager alternate scheduler name | `nil`
`alertmanager.persistentVolume.enabled` | If true, alertmanager will create a Persistent Volume Claim | `true`
`alertmanager.persistentVolume.accessModes` | alertmanager data Persistent Volume access modes | `[ReadWriteOnce]`
`alertmanager.persistentVolume.annotations` | Annotations for alertmanager Persistent Volume Claim | `{}`
`alertmanager.persistentVolume.existingClaim` | alertmanager data Persistent Volume existing claim name | `""`
`alertmanager.persistentVolume.mountPath` | alertmanager data Persistent Volume mount root path | `/data`
`alertmanager.persistentVolume.size` | alertmanager data Persistent Volume size | `2Gi`
`alertmanager.persistentVolume.storageClass` | alertmanager data Persistent Volume Storage Class | `unset`
`alertmanager.persistentVolume.subPath` | Subdirectory of alertmanager data Persistent Volume to mount | `""`
`alertmanager.podAnnotations` | annotations to be added to alertmanager pods | `{}`
`alertmanager.replicaCount` | desired number of alertmanager pods | `1`
`alertmanager.priorityClassName` | alertmanager priorityClassName | `nil`
`alertmanager.resources` | alertmanager pod resource requests & limits | `{}`
`alertmanager.securityContext` | Custom [security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for Alert Manager containers | `{}`
`alertmanager.service.annotations` | annotations for alertmanager service | `{}`
`alertmanager.service.clusterIP` | internal alertmanager cluster service IP | `""`
`alertmanager.service.externalIPs` | alertmanager service external IP addresses | `[]`
`alertmanager.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""`
`alertmanager.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]`
`alertmanager.service.servicePort` | alertmanager service port | `80`
`alertmanager.service.type` | type of alertmanager service to create | `ClusterIP`
`alertmanagerFiles.alertmanager.yml` | Prometheus alertmanager configuration | example configuration
`configmapReload.name` | configmap-reload container name | `configmap-reload`
`configmapReload.image.repository` | configmap-reload container image repository | `jimmidyson/configmap-reload`
`configmapReload.image.tag` | configmap-reload container image tag | `v0.2.2`
`configmapReload.image.pullPolicy` | configmap-reload container image pull policy | `IfNotPresent`
`configmapReload.extraArgs` | Additional configmap-reload container arguments | `{}`
`configmapReload.extraVolumeDirs` | Additional configmap-reload volume directories | `{}`
`configmapReload.extraConfigmapMounts` | Additional configmap-reload configMap mounts | `[]`
`configmapReload.resources` | configmap-reload pod resource requests & limits | `{}`
`initChownData.enabled`  | If false, don't reset data ownership at startup | true
`initChownData.name` | init-chown-data container name | `init-chown-data`
`initChownData.image.repository` | init-chown-data container image repository | `busybox`
`initChownData.image.tag` | init-chown-data container image tag | `latest`
`initChownData.image.pullPolicy` | init-chown-data container image pull policy | `IfNotPresent`
`initChownData.resources` | init-chown-data pod resource requests & limits | `{}`
`server.name` | Prometheus server container name | `server`
`server.image.repository` | Prometheus server container image repository | `prom/prometheus`
`server.image.tag` | Prometheus server container image tag | `v2.4.3`
`server.image.pullPolicy` | Prometheus server container image pull policy | `IfNotPresent`
`server.enableAdminApi` |  If true, Prometheus administrative HTTP API will be enabled. Please note, that you should take care of administrative API access protection (ingress or some frontend Nginx with auth) before enabling it. | `false`
`server.global.scrape_interval` | How frequently to scrape targets by default | `1m`
`server.global.scrape_timeout` | How long until a scrape request times out | `10s`
`server.global.evaluation_interval` | How frequently to evaluate rules | `1m`
`server.extraArgs` | Additional Prometheus server container arguments | `{}`
`server.prefixURL` | The prefix slug at which the server can be accessed | ``
`server.baseURL` | The external url at which the server can be accessed | ``
`server.extraHostPathMounts` | Additional Prometheus server hostPath mounts | `[]`
`server.extraConfigmapMounts` | Additional Prometheus server configMap mounts | `[]`
`server.extraSecretMounts` | Additional Prometheus server Secret mounts | `[]`
`server.configMapOverrideName` | Prometheus server ConfigMap override where full-name is `{{.Release.Name}}-{{.Values.server.configMapOverrideName}}` and setting this value will prevent the default server ConfigMap from being generated | `""`
`server.ingress.enabled` | If true, Prometheus server Ingress will be created | `false`
`server.ingress.annotations` | Prometheus server Ingress annotations | `[]`
`server.ingress.extraLabels` | Prometheus server Ingress additional labels | `{}`
`server.ingress.hosts` | Prometheus server Ingress hostnames | `[]`
`server.ingress.tls` | Prometheus server Ingress TLS configuration (YAML) | `[]`
`server.nodeSelector` | node labels for Prometheus server pod assignment | `{}`
`server.tolerations` | node taints to tolerate (requires Kubernetes >=1.6) | `[]`
`server.affinity` | pod affinity | `{}`
`server.priorityClassName` | Prometheus server priorityClassName | `nil`
`server.schedulerName` | Prometheus server alternate scheduler name | `nil`
`server.persistentVolume.enabled` | If true, Prometheus server will create a Persistent Volume Claim | `true`
`server.persistentVolume.accessModes` | Prometheus server data Persistent Volume access modes | `[ReadWriteOnce]`
`server.persistentVolume.annotations` | Prometheus server data Persistent Volume annotations | `{}`
`server.persistentVolume.existingClaim` | Prometheus server data Persistent Volume existing claim name | `""`
`server.persistentVolume.mountPath` | Prometheus server data Persistent Volume mount root path | `/data`
`server.persistentVolume.size` | Prometheus server data Persistent Volume size | `8Gi`
`server.persistentVolume.storageClass` | Prometheus server data Persistent Volume Storage Class |  `unset`
`server.persistentVolume.subPath` | Subdirectory of Prometheus server data Persistent Volume to mount | `""`
`server.podAnnotations` | annotations to be added to Prometheus server pods | `{}`
`server.deploymentAnnotations` | annotations to be added to Prometheus server deployment | `{}'
`server.replicaCount` | desired number of Prometheus server pods | `1`
`server.resources` | Prometheus server resource requests and limits | `{}`
`server.securityContext` | Custom [security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for server containers | `{}`
`server.service.annotations` | annotations for Prometheus server service | `{}`
`server.service.clusterIP` | internal Prometheus server cluster service IP | `""`
`server.service.externalIPs` | Prometheus server service external IP addresses | `[]`
`server.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""`
`server.service.loadBalancerSourceRanges` | list of IP CIDRs allowed access to load balancer (if supported) | `[]`
`server.service.nodePort` | Port to be used as the service NodePort (ignored if `server.service.type` is not `NodePort`) | `0`
`server.service.servicePort` | Prometheus server service port | `80`
`server.service.type` | type of Prometheus server service to create | `ClusterIP`
`serviceAccounts.alertmanager.create` | If true, create the alertmanager service account | `true`
`serviceAccounts.alertmanager.name` | name of the alertmanager service account to use or create | `{{ prometheus.alertmanager.fullname }}`
`serviceAccounts.kubeStateMetrics.create` | If true, create the kubeStateMetrics service account | `true`
`serviceAccounts.kubeStateMetrics.name` | name of the kubeStateMetrics service account to use or create | `{{ prometheus.kubeStateMetrics.fullname }}`
`serviceAccounts.nodeExporter.create` | If true, create the nodeExporter service account | `true`
`serviceAccounts.nodeExporter.name` | name of the nodeExporter service account to use or create | `{{ prometheus.nodeExporter.fullname }}`
`serviceAccounts.pushgateway.create` | If true, create the pushgateway service account | `true`
`serviceAccounts.pushgateway.name` | name of the pushgateway service account to use or create | `{{ prometheus.pushgateway.fullname }}`
`serviceAccounts.server.create` | If true, create the server service account | `true`
`serviceAccounts.server.name` | name of the server service account to use or create | `{{ prometheus.server.fullname }}`
`server.terminationGracePeriodSeconds` | Prometheus server Pod termination grace period | `300`
`server.retention` | (optional) Prometheus data retention | `""`
`serverFiles.alerts` | Prometheus server alerts configuration | `{}`
`serverFiles.rules` | Prometheus server rules configuration | `{}`
`serverFiles.prometheus.yml` | Prometheus server scrape configuration | example configuration
`extraScrapeConfigs` | Prometheus server additional scrape configuration | ""
`networkPolicy.enabled` | Enable NetworkPolicy | `false` |
`grafana.replicas` | Number of nodes | `1`
`grafana.deploymentStrategy` | Deployment strategy | `RollingUpdate`
`grafana.livenessProbe` | Liveness Probe settings | `{ "httpGet": { "path": "/api/health", "port": 3000 } "initialDelaySeconds": 60, "timeoutSeconds": 30, "failureThreshold": 10 }
`grafana.readinessProbe` | Rediness Probe settings | `{ "httpGet": { "path": "/api/health", "port": 3000 }
`grafana.securityContext` | Deployment securityContext | `{"runAsUser": 472, "fsGroup": 472}`
`grafana.image.repository` | Image repository | `grafana/grafana`
`grafana.image.tag` | Image tag. (`Must be >= 5.0.0`) | `5.3.4`
`grafana.image.pullPolicy` | Image pull policy | `IfNotPresent`
`grafana.service.type` | Kubernetes service type | `ClusterIP`
`grafana.service.port` | Kubernetes port where service is exposed | `80`
`grafana.service.annotations` | Service annotations | `{}`
`grafana.service.labels` | Custom labels | `{}`
`grafana.ingress.enabled` | Enables Ingress | `false`
`grafana.ingress.annotations` | Ingress annotations | `{}`
`grafana.ingress.labels` | Custom labels | `{}`
`grafana.ingress.hosts` | Ingress accepted hostnames | `[]`
`grafana.ingress.tls` | Ingress TLS configuration | `[]`
`grafana.resources` | CPU/Memory resource requests/limits | `{}`
`grafana.nodeSelector` | Node labels for pod assignment | `{}`
`grafana.tolerations` | Toleration labels for pod assignment | `[]`
`grafana.affinity` | Affinity settings for pod assignment | `{}`
`grafana.schedulerName` | Alternate scheduler name | `nil`
`grafana.env` | Extra environment variables passed to pods | `{}`
`grafana.custom.ini` | Grafana's primary configuration | `{}`
`grafana.annotations` | Deployment annotations | `{}`
`grafana.podAnnotations` | Pod annotations | `{}`

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install ./helm --name my-prometheus \
    --set server.terminationGracePeriodSeconds=360
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install ./helm --name my-prometheus -f values.yaml
```

### ConfigMap Files
AlertManager is configured through [alertmanager.yml](https://prometheus.io/docs/alerting/configuration/). This file (and any others listed in `alertmanagerFiles`) will be mounted into the `alertmanager` pod.

Prometheus is configured through [prometheus.yml](https://prometheus.io/docs/operating/configuration/). This file (and any others listed in `serverFiles`) will be mounted into the `server` pod.

### Ingress TLS
If your cluster allows automatic creation/retrieval of TLS certificates (e.g. [cert manager](https://github.com/jetstack/cert-manager)), please refer to the documentation for that mechanism.

To manually configure TLS, first create/retrieve a key & certificate pair for the address(es) you wish to protect. Then create a TLS secret in the namespace:

```console
kubectl create secret tls prometheus-server-tls --cert=path/to/tls.cert --key=path/to/tls.key
```

Include the secret's name, along with the desired hostnames, in the alertmanager/server Ingress TLS section of your custom `values.yaml` file:

```yaml
server:
  ingress:
    ## If true, Prometheus server Ingress will be created
    ##
    enabled: true

    ## Prometheus server Ingress hostnames
    ## Must be provided if Ingress is enabled
    ##
    hosts:
      - prometheus.domain.com

    ## Prometheus server Ingress TLS configuration
    ## Secrets must be manually created in the namespace
    ##
    tls:
      - secretName: prometheus-server-tls
        hosts:
          - prometheus.domain.com
```

### NetworkPolicy

Enabling Network Policy for Prometheus will secure connections to Alert Manager
and Kube State Metrics by only accepting connections from Prometheus Server.
All inbound connections to Prometheus Server are still allowed.

To enable network policy for Prometheus, install a networking plugin that
implements the Kubernetes NetworkPolicy spec, and set `networkPolicy.enabled` to true.

If NetworkPolicy is enabled for Prometheus' scrape targets, you may also need
to manually create a networkpolicy which allows it.


__Note__: This chart is based off of the [upstream community chart](https://github.com/helm/charts/tree/master/stable/prometheus).
