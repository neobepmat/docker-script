# Kubernetes Cluster first start

## Creating the cluster

```language
sudo kubeadm init --pod-network-cidr=10.99.0.0/16
```


## Welcome message

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

sudo kubeadm join 172.104.250.36:6443 --token 4yyrcy.iyko84g4w5vll1j4 --discovery-token-ca-cert-hash sha256:4ce71bf6182e74f467fc20f256fe41996aaacf2dd4959db06e19075fea2746cb


## Join worker to cluster

sudo kubeadm join 172.104.250.36:6443 --token mzqp1j.os2c43acg0kkwqab --discovery-token-ca-cert-hash sha256:ea5eef9665d3f03e756577451d82b62f49e6c349ae023a324fb5a817522d845f9

### Joint Token expired

In case the join token has expired, execute this command to generate a new one:

> kubeadm token create


## Remove Node from join

> sudo kubeadm reset cleanup-node