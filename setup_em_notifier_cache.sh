#!/bin/bash
#!/bin/bash
if [ $# -lt 1 ]
then
    echo "Please provide the database ip address"
    exit 1
fi
dnc make.dn -v
dana make -l config/build/dc/cache/cache.config
cd ..
docker build -t em-cache:notifier -f- . < interscity_dana_project/config/docker/emergent-microservice-hpa-notifier/Dockerfile
docker tag em-cache:notifier $1/em-cache:notifier
docker push $1/em-cache:notifier
