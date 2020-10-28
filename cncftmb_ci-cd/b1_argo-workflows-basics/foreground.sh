#!/bin/bash

echo "Wait for controlplane"
until kubectl get node controlplane; do printf '.' && sleep 5 ; done && \
kubectl wait node/controlplane --for=condition=Ready --timeout "2m"

echo "Wait for node01"
until kubectl get node node01; do printf '.' && sleep 5 ; done && \
kubectl wait node/node01 --for=condition=Ready --timeout "2m"

echo "Deploying lab components: Helm, OpenEBS, Contour"

sleep 2; wait.sh
