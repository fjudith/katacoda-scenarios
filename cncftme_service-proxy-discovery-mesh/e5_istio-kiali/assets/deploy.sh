#!/bin/bash

cd /root

# Istio
export ISTIO_VERSION="1.7.3"
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

## Contour
kubectl label node controlplane ingress-ready="true"
kubectl apply --wait -f https://projectcontour.io/quickstart/contour.yaml
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

# BookInfo
kubectl label namespace default isio-injection=true
kubectl apply --wait -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply --wait -f bookinfo-ingress.yaml

# Kiali
bash <(curl -L https://kiali.io/getLatestKialiOperator) --accessible-namespaces '**' --auth-strategy 'anonymous'
kubectl apply --wait -f kiali-ingress.yaml