#!/bin/bash
#!/bin/bash
if [ $# -lt 1 ]
then
    echo "Please provide the database ip address"
    exit 1
fi
dnc make.dn -v
dana make -l config/build/dc/all_configs/all_configs.config
cd ..
docker build -t metric-server:1.0 -f- . < interscity_dana_project/config/docker/metric-server/Dockerfile
docker tag metric-server:1.0 $1/metric-server:1.0 
docker push $1/metric-server:1.0