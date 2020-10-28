# Install Argo

* Add Argo's Helm charts repository:

`helm repo add argo https://argoproj.github.io/argo-helm`{{execute}}

* Deploy Argo components:

```bash
helm upgrade --install argo --namespace argo \
--values values.yaml \
"argo/argo" --wait --timeout 5m
```{{execute}}
