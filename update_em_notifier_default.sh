#!/bin/bash
dnc make.dn -v
dana make -l config/build/dc/default/default.config
cd ..
docker build -t em-default:notifier -f- . < interscity_dana_project/config/docker/emergent-microservice-hpa-notifier/Dockerfile
docker tag em-default:notifier robertovrf/em-default:notifier
docker push robertovrf/em-default:notifier
