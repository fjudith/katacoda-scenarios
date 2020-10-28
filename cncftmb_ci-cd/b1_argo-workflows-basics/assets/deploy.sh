#!/bin/bash

set -e

until kubectl get node controlplane; do printf '.' && sleep 5 ; done && \
kubectl wait node/controlplane --for=condition=Ready --timeout "2m"

until kubectl get node node01; do printf '.' && sleep 5 ; done && \
kubectl wait node/node01 --for=condition=Ready --timeout "2m"

cd /root

# httpie
pip3 install httpie

# Helm
curl -fsSL -o ${PWD}/get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
chmod +x ${PWD}/get_helm.sh && \
${PWD}/get_helm.sh

## Contour
kubectl label node $(hostname) ingress-ready="true" --overwrite
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

kubectl wait --for=condition="Ready" -n projectcontour pod -l app=envoy

## OpenEBS
kubectl create ns openebs && \
helm repo add openebs https://openebs.github.io/charts && \
helm repo update && \
helm upgrade --install openebs --namespace openebs openebs/openebs --wait && \

kubectl wait --for=condition="Ready" -n openebs pod -l component=localpv-provisioner

kubectl patch storageclass openebs-hostpath -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

## Minio Client
MINIO_CLIENT_VERSION="RELEASE.2020-10-03T02-54-56Z"
MINIO_CLIENT_SHA256="59e184bd4e2c3a8a19837b0f0da3977bd4e301495a24e4a5d50e291728a1de51"

curl -L https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MINIO_CLIENT_VERSION} -o /usr/local/bin/mc && \
echo "${MINIO_CLIENT_SHA256} /usr/local/bin/mc | sha256sum --check" && \
chmod +x /usr/local/bin/mc
