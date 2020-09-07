#!/bin/bash

cd /root/

docker container run \
--name=scope \
-d \
--net=host \
--pid=host \
--privileged \
-v /var/run/docker.sock:/var/run/docker.sock:rw \
weaveworks/scope:1.13.1 --probe.docker=true

/usr/local/bin/docker-compose pull

/usr/local/bin/docker-compose up -d