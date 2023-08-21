#!/bin/bash
cd config/kubernetes/db
kubectl apply -f mydb.yaml
kubectl expose deployment mydb --type LoadBalancer --port 3306 --target-port 3306
cd ../../../scripts/dana
dnc . -v