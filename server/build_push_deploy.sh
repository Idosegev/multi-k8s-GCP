#!/bin/bash

docker build -t idosegev/react-multi-container-app-server . ;
docker push idosegev/react-multi-container-app-server ; 
kubectl delete -f ../k8s ;
kubectl apply -f ../k8s 

