# Install Argo

* Add Argo's Helm charts repository:

`helm repo add argo https://argoproj.github.io/argo-helm`{{execute}}

* Deploy Argo components:

```bash
helm upgrade --install argo --namespace argo \
--values ./values.yaml \
"argo/argo" --wait --timeout 5m
```{{execute}}

* Deploy the [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resource to access the Web UI.

`kubectl apply -f argo-ingress.yaml

* Check the Argo deployment:

`kubectl -n argo get pods,service,configmap,ingress`{{execute}}