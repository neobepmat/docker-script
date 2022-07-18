# NFS Subdir Provisioner

## NFS configuration for Postgres Zalando

Install Helm chart, in case the nsf-subdir has already been installed you have to specify a different storage class name and a different nfs path

```language
helm install nfs-subdir-external-provisioner-pgzal nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=172.10.250.75 --set nfs.path=/volume1/k8-nsf/cla-pgzal/ --set storageClass.name=nfs-client-pgzal --namespace cla-pg-zal
```