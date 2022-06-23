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

sudo kubeadm join 172.104.250.36:6443 --token mzqp1j.os2c43acg0kkwqab \
        --discovery-token-ca-cert-hash sha256:ea5eef9665d3f03e756577451d82b62f49e6c39ae023a324fb5a817522d845f9


Calico network is the Pod Network chosen

The POD CIDR is
 > 10.244.0.0/16