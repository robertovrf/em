#!/bin/bash
if [ $# -lt 1 ]
then
    echo "Please provide the database ip address"
    exit 1
fi
dnc make.dn -v
dana make -l config/build/dc/all_configs/all_configs.config
cd ..
docker build -t emergent-microservice:all -f- . < interscity_dana_project/config/docker/emergent-microservice-all/Dockerfile
docker tag emergent-microservice:all $1/emergent-microservice:all 
docker push $1/emergent-microservice:all