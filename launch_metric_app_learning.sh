#!/bin/bash
cd config/kubernetes/emergent-microservice
kubectl apply -f emergent-microservice-hpa-learning.yaml
kubectl expose deployment emergent-microservice --type LoadBalancer --port 2020 --target-port 2020