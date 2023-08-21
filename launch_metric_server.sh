#!/bin/bash
cd config/kubernetes/metric-server
kubectl apply -f metric-server.yaml
kubectl expose deployment metric-server --type LoadBalancer --port 2006 --target-port 2006
