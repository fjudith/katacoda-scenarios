#!/bin/bash

cd /root

# Istio
ISTIO_VERSION="1.7.3"
curl -L https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux-amd64.tar.gz | tar xvzf -
chmod +x istio-${ISTIO_VERSION}/bin/istioctl
sudo ln -s /usr/local/bin/istioctl ${PWD}/istio-${ISTIO_VERSION}/bin/istioctl
istioctl install --set profile=demo --force

# BookInfo
kubectl label namespace default isio-injection=true
kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml --wait
kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/productpage-nodeport.yaml --wait

# Kiali
kubectl apply -f istio-${ISTIO_VERSION}/samples/addons/kiali.yaml --wait
