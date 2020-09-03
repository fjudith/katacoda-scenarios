#!/bin/bash

wait_file() {
  local file="$1"; shift
  local wait_seconds="${1:-10}"; shift # 10 seconds as default timeout

  until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

  ((++wait_seconds))
}

sudo grep -i "done" /opt/katacoda-background-finished &> /dev/null
if [[ "$?" -eq 0 ]]; then
exit
fi

while true; do sudo grep -i "done" /opt/katacoda-finished > /dev/null && break || sleep 2; done

echo "Everything ready... Finalise the deployment"

/usr/local/bin/deploy.sh

echo "done" | sudo tee /root/katacoda-background-finished



wait_file docker-compose.yaml
wait_file Dockerfile

echo "done" >> /root/katacoda-finished

/usr/local/bin/deploy.sh

echo "done" >> /root/katacoda-background-finished