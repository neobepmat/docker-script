# Post Installation backlog

This file contains all the instruction to repeat the same installation steps on this machine.


## Connect to account cla-operation on Github

To clone git repository _docker-script_ a valid SSH key must be created and add to cla-operation Github account.


### Create ssh key

From the _home_ folder of user _administrator_

Create the ssh hidden folder
> mkdir .ssh

Change permissions
> chmod 700 ~/.ssh

Create SSH key
> cd .ssh
> ssh-keygen -t ed25519 -C "cladb-kube"

Add public SSH key to the account _cla-operation_


### Add ssh key to agent

Run ssh Agent
> eval $(ssh-agent -s)

Add just created ssh key
> ssh-add ~/.ssh/<%name of private ssh key%>



### SSH connection issues

In case of issues connectiong to the SSH port of Github, In the folder _.ssh_ 
> create the file _config_

copy these lines

```
Host github.com
   Hostname ssh.github.com
   Port 443
   IdentityFile ~/.ssh/<%the name of your private ssh file%>
```

### Clone Docker-Script repository

Back to administrator home folder
> cd ~

Create folder
> mkdir git

Clone repository
> git clone git@github.com:cla-operation/docker-script.git

the folder _docker-script_ is created and the repository is cloned

---

## Install Kubernetes


### Install kubelet, kubeadm, kubectl

```
sudo apt update
sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Install required packages

```
sudo apt update
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

Confirm installation by checking the version of kubectl.
```
kubectl version --client && kubeadm version
```

You should receive something similar to this
```
Client Version: version.Info{Major:"1", Minor:"22", GitVersion:"v1.22.1", GitCommit:"632ed300f2c34f6d6d15ca4cef3d3c7073412212", GitTreeState:"clean", BuildDate:"2021-08-19T15:45:37Z", GoVersion:"go1.16.7", Compiler:"gc", Platform:"linux/amd64"}
kubeadm version: &version.Info{Major:"1", Minor:"22", GitVersion:"v1.22.2", GitCommit:"8b5a19147530eaac9476b0ab82980b4088bbc1b2", GitTreeState:"clean", BuildDate:"2021-09-15T21:37:34Z", GoVersion:"go1.16.8", Compiler:"gc", Platform:"linux/amd64"}
```

---

## Disable Swap

Turn off swap

```
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
```

Enable kernel modules and configure sysctl


```
# Enable kernel modules
sudo modprobe overlay
sudo modprobe br_netfilter

# Add some settings to sysctl
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

# Reload sysctl
sudo sysctl --system
```

---


## Install Container Runtime

Docker has been chosen as CRI (Container Runtime Interface).

### Add repo and install packages

```
sudo apt update
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io docker-ce docker-ce-cli
```