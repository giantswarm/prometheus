# How to create self signed certificates for ingress

Install [cfssl]() first.

```bash
cfssl print-defaults config > ca-config.json
cfssl print-defaults csr > ca-csr.json
cfssl print-defaults csr > server.json
```

Edit `server.json` and replace velues for `CN` and `hosts` by "grafana.local.net" or similar.

```bash
cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
```

Create a `secret` named `grafana-tls-secret` then for the url "grafana.local.net":

```bash
kubectl --namespace monitoring create secret generic grafana-tls-secret \
  --from-file=tls.crt=server.pem \
  --from-file=tls.key=server-key.pem
```

We can now reference this `secret` in our ingress under `spec.tls`.
