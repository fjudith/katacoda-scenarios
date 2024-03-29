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
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml --wait
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

kubectl wait --for=condition="Ready" -n projectcontour pod -l app=contour --timeout "5m"
kubectl wait --for=condition="Ready" -n projectcontour pod -l app=envoy --timeout "5m"

## OpenEBS
kubectl create namespace openebs && \
helm repo add openebs https://openebs.github.io/charts && \
helm repo update && \
helm upgrade --install openebs --namespace openebs openebs/openebs --wait && \

kubectl wait --for=condition="Ready" -n openebs pod -l component=localpv-provisioner --timeout "5m"

sleep 5

kubectl patch storageclass openebs-hostpath -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

## Argo tools
cd /root/ && \
/usr/bin/docker-compose pull && \
/usr/bin/docker-compose up -d && \
alias mc="docker exec argo-tools mc" && \
alias argo="docker exec argo-tools argo"