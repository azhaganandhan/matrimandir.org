#!/bin/bash
docker build -t azhaganandhan/matrimandir.org .
docker push azhaganandhan/matrimandir.org
microk8s kubectl rollout restart deployment/matrimandir.org
