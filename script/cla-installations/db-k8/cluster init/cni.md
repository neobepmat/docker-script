# Kubernetes CNI

The chosen CNI is Calico

- Quickstart
> https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart


- Installation
> kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml

## Db-k8 configuration

The POD CIDR is
 > 10.244.0.0/16

> 10.99.0.0/16


## Removing Calico

kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml

kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml