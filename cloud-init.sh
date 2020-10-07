#!/bin/sh

# download the CTF manifests
curl -Lo /var/lib/rancher/k3s/server/manifests/ctf.yaml https://tamu.ctf.soluble.cloud/static/cinderella-ctf/ctf.yaml

# set kubeconfig to default file
su soluble -c -- "/usr/local/bin/kubectl config view --raw >> /home/soluble/.kube/config"

# enable bash completion for kubectl
su soluble -c -- "/usr/local/bin/kubectl completion bash >> /home/soluble/.kube/bash_completion.sh"
su soluble -c -- "echo 'source /home/soluble/.kube/bash_completion.sh' >> /home/soluble/.bashrc"

# download the manifest for 101/II - Workloads section
curl -Lo /home/soluble/deployment.yaml https://tamu.ctf.soluble.cloud/static/cinderella-ctf/deployment.yaml
chmod 777 /home/soluble/deployment.yaml


#Install Docker to allow user to run entire course through Cinderella
sudo yum install -y docker
sudo service docker start