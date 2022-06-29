# Service Account to login Kubernetes Dashboard

This file contains information and commands to create a service account for login purposes to K8s Dashboard.

The service account created is _dashboard-admin-sa_

- Create service account
> kubectl create serviceaccount -n kube-system dashboard-admin-sa


- Manage cluster role binding
> kubectl create clusterrolebinding -n kube-system dashboard-admin-sa --clusterrole=cluster-admin   --serviceaccount=kube-system:dashboard-admin-sa

- Generate a valid token
> kubectl create token dashboard-admin-sa


## K8s 1.22+

Since version 1.22, the service account doesn't have a Secret section anymore in the yaml file

```language
TOKEN=$(kubectl describe secret -n kube-system $(kubectl get secret -n kube-system | awk '/^cluster-admin-dashboard-sa-token-/{print $1}') | awk '$1=="token:"{print $2}')

kubectl get secret $(kubectl get serviceaccount dashboard-admin-sa -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
```