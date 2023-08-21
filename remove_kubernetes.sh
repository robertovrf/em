#!/bin/bash
kubectl delete deploy emergent-microservice
kubectl delete deploy mydb
kubectl delete svc emergent-microservice
kubectl delete svc mydb