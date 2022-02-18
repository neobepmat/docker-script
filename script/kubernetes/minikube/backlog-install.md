# Kubernetes on local environment - Install

## Installation steps

### Install minikube (for local environments) from binaries (Linux x86-64)
> curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
> sudo install minikube-linux-amd64 /usr/local/bin/minikube

### Install kubectl
> https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

_Download with curl_
>curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

_Install kubectl_
>sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

