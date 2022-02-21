#!/bin/bash

docker build -t idosegev/react-multi-container-app-client:latest -t idosegev/react-multi-container-app-client:$SHA -f ./client/Dockerfile ./client
docker build -t idosegev/react-multi-container-app-server:latest -t idosegev/react-multi-container-app-server:$SHA -f ./server/Dockerfile ./server
docker build -t idosegev/react-multi-container-app-worker:latest -t idosegev/react-multi-container-app-worker:$SHA -f ./worker/Dockerfile ./worker
docker push idosegev/react-multi-container-app-client:latest
docker push idosegev/react-multi-container-app-server:latest
docker push idosegev/react-multi-container-app-worker:latest
docker push idosegev/react-multi-container-app-client:$SHA
docker push idosegev/react-multi-container-app-server:$SHA
docker push idosegev/react-multi-container-app-worker:$SHA
kubectl 
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=idosegev/react-multi-container-app-client:$SHA
kubectl set image deployments/server-deployment server=idosegev/react-multi-container-app-server:$SHA
kubectl set image deployments/worker-deployment worker=idosegev/react-multi-container-app-worker:$SHA