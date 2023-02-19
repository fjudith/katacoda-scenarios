#!/bin/bash

wait_file() {
  local file="$1"; shift
  local wait_seconds="${1:-10}"; shift # 10 seconds as default timeout

  until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

  ((++wait_seconds))
}

echo "done" >> /root/katacoda-finished

/usr/local/bin/install_sal.sh
/usr/local/bin/iscsi.sh

echo "done" >> /root/katacoda-background-finished