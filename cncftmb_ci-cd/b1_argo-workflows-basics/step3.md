# Install Argo

* Add Argo's Helm charts repository:

````bash
helm repo add argo https://argoproj.github.io/argo-helm
```{{execute}}

* Deploy Argo components:

```bash
helm upgrade --install argo --namespace argo \
--values ./values.yaml \
"argo/argo" --wait --timeout 5m
```{{execute}}

* Deploy the [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resource to access the Web UI.

```bash
kubectl apply -f argo-ingress.yaml
```{{execute}}

* Check the Argo deployment:

```bash
kubectl -n argo get pods,service,configmap,ingress
```{{execute}}