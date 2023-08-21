#!/bin/bash
dnc make.dn -v
dana make -l config/build/dc/all_configs/all_configs.config
cd ..
docker build -t emergent-microservice:all -f- . < interscity_dana_project/config/docker/emergent-microservice-all/Dockerfile
docker tag emergent-microservice:all robertovrf/emergent-microservice:all 
docker push robertovrf/emergent-microservice:all