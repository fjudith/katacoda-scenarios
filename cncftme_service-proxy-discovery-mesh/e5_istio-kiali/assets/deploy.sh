#!/bin/bash

cd /root

# httpie
pip3 install httpie

# Helm
curl -fsSL -o ${PWD}/get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x ${PWD}/get_helm.sh
${PWD}/get_helm.sh

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
kubectl label node $(hostname) ingress-ready="true"
kubectl apply --wait -f https://projectcontour.io/quickstart/contour.yaml
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

# BookInfo
kubectl label namespace default istio-injection="enabled"
kubectl apply --wait -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply --wait -f bookinfo-ingress.yaml

# Kiali
kubectl apply --wait -f istio-${ISTIO_VERSION}/samples/addons/prometheus.yaml
kubectl apply --wait -f istio-${ISTIO_VERSION}/samples/addons/jaeger.yaml
kubectl apply --wait -f istio-${ISTIO_VERSION}/samples/addons/grafana.yaml
bash <(curl -L https://kiali.io/getLatestKialiOperator) --accessible-namespaces '**' --auth-strategy 'anonymous'
kubectl apply --wait -f kiali-ingress.yaml