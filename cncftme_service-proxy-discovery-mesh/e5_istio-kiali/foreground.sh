#!/bin/bash

echo "Deploying lab components:"
echo " "
echo "|----------+--------------------|"
echo "| Istio    | service mesh       |"
echo "|----------+--------------------|"
echo "| Contour  | ingress controller |"
echo "|----------+--------------------|"
echo "| Bookinfo | sample application |"
echo "|----------+--------------------|"

sleep 2

wait.sh
