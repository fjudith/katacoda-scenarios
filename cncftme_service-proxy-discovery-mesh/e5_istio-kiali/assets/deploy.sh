#!/bin/bash

cd /root

# Istio
ISTIO_VERSION="1.7.3"
curl -L https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux-amd64.tar.gz | tar xvzf -
chmod +x istio-${ISTIO_VERSION}/bin/istioctl
sudo ln -s ${PWD}/istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/istioctl
istioctl operator init
kubectl create ns istio-system
kubectl apply --wait -f - <<EOF
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: example-istiocontrolplane
spec:
  profile: demo
EOF

# BookInfo
kubectl label namespace default isio-injection=true
kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml --wait
kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/productpage-nodeport.yaml --wait

# Kiali
kubectl apply -f istio-${ISTIO_VERSION}/samples/addons/kiali.yaml --wait
