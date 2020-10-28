#!/bin/bash

wait_file() {
  local file="$1"; shift
  local wait_seconds="${1:-10}"; shift # 10 seconds as default timeout

  until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

  ((++wait_seconds))
}

wait_file /usr/local/bin/deploy.sh
wait_file /root/argo-ingress.yaml

echo "done" >> /root/katacoda-finished

/usr/local/bin/deploy.sh

echo "done" >> /root/katacoda-background-finished