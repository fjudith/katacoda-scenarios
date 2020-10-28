# Install Argo

[Argo](https://argoproj.github.io/projects/argo) can be installed using either [Helm](https://github.com/argoproj/argo-helm), [Kustomize](https://github.com/argoproj/argo/tree/stable/manifests) and straight forward [kubectl](https://github.com/argoproj/argo/tree/stable/manifests).

We will leverage the [Helm](https://github.com/argoproj/argo-helm) method as we need to make few adjustments to the default configuration.

> Like configuring the [Minio](https://min.io) storage deployed in the previous step.

* Create the [**Secret**]()

* Create the Helm `values.yaml` deployment customization file:

```bash
cat << EOF > values.yaml
image:
  tag: v2.11.6
server:
  ingress:
    enabled: "true"
artifactRepository:
  archiveLogs: true
  s3:
    endpoint: "http://minio.argo:9000"
    bucket: "argo"
    accessKeySecret:
      key: "accesskey"
    secretKeySecret:
      key: "secretkey"
    insecure: "true"
EOF
```{{execute}}

* Add Argo's Helm charts repository:

`helm repo add argo https://argoproj.github.io/argo-helm`{{execute}}

* Deploy Argo components:

```bash
helm upgrade --install argo --namespace argo \
--values values.yaml \
"argo/argo" --wait --timeout 5m
```{{execute}}
