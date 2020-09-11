#!/bin/sh

kubectl config view --raw >> ~/.kube/config

curl -O ctf.yaml https://soluble-ai.github.io/k8s-intro/static/cinderella-ctf/ctf.yaml
kubectl apply -f ctf.yaml
shred -u ctf.yaml

shred -u ${0}
