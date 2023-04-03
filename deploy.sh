#!/bin/sh

TAG=mlops

for dockerfile in $(ls ./dockerfiles/*.Dockerfile)
do
    img_name=$(basename "$dockerfile" .Dockerfile)

    docker build -t "$img_name:$TAG" -f "$dockerfile" .

    kubectl apply -f ./k8s/deployment.yaml 
done
