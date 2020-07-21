#!/bin/bash
docker build -t docker.talam.io/matrimandir .
docker push docker.talam.io/matrimandir
microk8s kubectl rollout restart deployment/matrimandir
