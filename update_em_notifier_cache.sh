#!/bin/bash
dnc make.dn -v
dana make -l config/build/dc/cache/cache.config
cd ..
docker build -t em-cache:notifier -f- . < interscity_dana_project/config/docker/emergent-microservice-hpa-notifier/Dockerfile
docker tag em-cache:notifier robertovrf/em-cache:notifier
docker push robertovrf/em-cache:notifier
