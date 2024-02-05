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
docker build -t em-hpa:learning -f- . < interscity_dana_project/config/docker/emergent-microservice-hpa-learning/Dockerfile
docker tag em-hpa:learning $1/em-hpa:learning
docker push $1/em-hpa:learning