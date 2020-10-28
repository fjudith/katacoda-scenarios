# Install Minio

Before installing the Argo component, it is recommended to already have an object storage solution (e.g like Amazon S3) to stash artifacts exchanged between workflows tasks.

[Minio](https://min.io) is a popular open-source S3-compatible object storage server that anyone can deploy.

Run the following commands to run the Minio server **in the same location** as the Argo components. 

* Create the Argo Namespace:

`kubectl create namespace argo`{{execute}}

* Add Minio's Helm charts repository:

`helm repo add minio https://helm.min.io`{{execute}}

* Deploy the Minio storage server with the following configuration:
  * **Access key**: `argo`
  * **Secret Key**: `P4ssw0rd`

```bash
helm upgrade --install minio --namespace argo \
--set accessKey="argo" \
--set secretKey="P4ssw0rd" \
--set ingress.enabled="true" \
--set ingress.path="/minio" \
--set defaultBucket.enabled="true" \
--set defaultBucket.name="bucket" \
--set resources.requests.memory="500m" \
--set persistence.size="5Gi" \
minio/minio --wait --timeout 5m
```{{execute}}
