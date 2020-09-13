#!/bin/sh

# download the CTF manifests
curl -o /var/lib/rancher/k3s/server/manifests/ctf.yaml https://soluble-ai.github.io/k8s-tamu/static/cinderella-ctf/ctf.yaml

# set kubeconfig to default file
su soluble -c -- "/usr/local/bin/kubectl config view --raw >> /home/soluble/.kube/config"

# enable bash completion for kubectl
su soluble -c -- "/usr/local/bin/kubectl completion bash >> /home/soluble/.kube/bash_completion.sh"
su soluble -c -- "echo 'source /home/soluble/.kube/bash_completion.sh' >> /home/soluble/.bashrc"

# download the manifest for 101/II - Workloads section
curl -o /home/soluble/deployment.yaml https://soluble-ai.github.io/k8s-tamu/static/cindefella-ctf/deployment.yaml
chmod 777 /home/soluble/deployment.yaml
