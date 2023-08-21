#!/bin/bash
dnc make.dn -v
dana make -l config/build/dc/all_configs/all_configs.config
cd ..
docker build -t metric-server:1.0 -f- . < interscity_dana_project/config/docker/metric-server/Dockerfile
docker tag metric-server:1.0 robertovrf/metric-server:1.0 
docker push robertovrf/metric-server:1.0