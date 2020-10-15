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

kubectl wait --for=condition="Ready" -n istio-system  pod -l app=istiod
kubectl wait --for=condition="Ready" -n istio-system  pod -l app=istio-ingressgateway
kubectl wait --for=condition="Ready" -n istio-system  pod -l app=istio-egressgateway


## Contour
kubectl label node $(hostname) ingress-ready="true"
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

kubectl wait --for=condition="Ready" -n projectcontour pod -l app=envoy


# BookInfo
kubectl label namespace default istio-injection="enabled"
sleep 3
kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f bookinfo-ingress.yaml

kubectl wait --for=condition="Ready" -n default pod -l app=details
kubectl wait --for=condition="Ready" -n default pod -l app=productpage
kubectl wait --for=condition="Ready" -n default pod -l app=ratings
kubectl wait --for=condition="Ready" -n default pod -l app=reviews


# Kiali
kubectl apply -f istio-${ISTIO_VERSION}/samples/addons/prometheus.yaml
kubectl apply -f istio-${ISTIO_VERSION}/samples/addons/jaeger.yaml
kubectl apply -f istio-${ISTIO_VERSION}/samples/addons/grafana.yaml
bash <(curl -L https://kiali.io/getLatestKialiOperator) --accessible-namespaces '**' --auth-strategy 'anonymous'
kubectl apply -f kiali-ingress.yaml

kubectl wait --for=condition="Ready" -n istio-system pod -l app=prometheus
kubectl wait --for=condition="Ready" -n istio-system pod -l app=jager
kubectl wait --for=condition="Ready" -n istio-system pod -l app=grafana
kubectl wait --for=condition="Ready" -n istio-system pod -l app=kiali
