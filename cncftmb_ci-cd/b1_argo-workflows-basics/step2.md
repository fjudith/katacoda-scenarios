# Configure Argo

[Argo](https://argoproj.github.io/projects/argo) can be installed using either [Helm](https://github.com/argoproj/argo-helm), [Kustomize](https://github.com/argoproj/argo/tree/stable/manifests) and straight forward [kubectl](https://github.com/argoproj/argo/tree/stable/manifests).

We will leverage the [Helm](https://github.com/argoproj/argo-helm) method as we need to make few adjustments to the default configuration.

> Like configuring the [Minio](https://min.io) storage deployed in the previous step.

* Create the [**Secret**]()

* Create the Helm `values.yaml` deployment customization file:

```bash
cat << EOF > values.yaml
images:
  tag: v2.11.6
useDefaultArtifactRepo: True
useStaticCredentials: True
artifactRepository:
  archiveLogs: true
  s3:
    endpoint: "http://minio.argo:9000"
    bucket: "argo"
    accessKeySecret:
      name: minio
      key: "accesskey"
    secretKeySecret:
      name: minio
      key: "secretkey"
    insecure: true
EOF
```{{execute}}
