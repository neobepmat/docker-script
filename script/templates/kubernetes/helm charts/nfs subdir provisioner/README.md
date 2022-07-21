# README - NFS Subdir Provisioner

> https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner

## NFS configuration in a short

Add helm repository
```
$ helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
```

Install chart release
```bash
helm install /
nfs-subdir-external-provisioner /
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner /
--set nfs.server=172.10.250.75 /
--set nfs.path=/volume1/k8-nsf/cla-pg-zal/
```

```powershell
helm install `
nfs-subdir-external-provisioner `
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner `
--set nfs.server=172.10.250.75 `
--set nfs.path=/volume1/k8-nsf/cla-pg-zal/ `
--set storageClass.name=nfs-pg-zal
```

Install Helm chart, in case the nfs-subdir has already been installed you have to specify a different storage class name and a different nfs path
```bash
helm install /
nfs-subdir-external-provisioner-mssql /
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner /
--set nfs.server=172.10.250.75 /
--set nfs.path=/volume1/k8-nsf/cla-mssql/ /
--set storageClass.name=nfs-client-mssql /
--set storageClass.provisionerName=k8s-sigs.io/ /
--namespace cla-mssql-nfs
```