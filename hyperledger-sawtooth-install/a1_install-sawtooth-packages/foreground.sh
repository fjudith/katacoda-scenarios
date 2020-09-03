#!/bin/bash


/usr/local/bin/docker-compose up -d --build
sleep 1 ; docker container exec -it chsa-a1-00 bash