#!/bin/bash

docker build -t idosegev/react-multi-container-app-client . ;
docker push idosegev/react-multi-container-app-client ; 
kubectl delete -f ../k8s ;
kubectl apply -f ../k8s 

