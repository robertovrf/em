#!/bin/bash
dnc make.dn -v
dana make -l config/build/dc/all_configs/all_configs.config
cd ..
docker build -t em-hpa:learning -f- . < interscity_dana_project/config/docker/emergent-microservice-hpa-learning/Dockerfile
docker tag em-hpa:learning robertovrf/em-hpa:learning
docker push robertovrf/em-hpa:learning