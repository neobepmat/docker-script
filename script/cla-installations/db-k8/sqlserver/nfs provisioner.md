# NFS configuration

- Install Helm chart, in case the nsf-subdir has already been installed you have to specify a different storage class name and a different nfs path

```bash
helm install / 
nfs-subdir-external-provisioner-mssql /
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner /
--set nfs.server=172.10.250.75 /
--set nfs.path=/volume1/k8-nsf/cla-mssql/ /
--set storageClass.name=nfs-client-mssql /
--namespace cla-mssql-nfs
```

```powershell
helm install ` 
nfs-subdir-external-provisioner-mssql `
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner `
--set nfs.server=172.10.250.75 `
--set nfs.path=/volume1/k8-mssql/ `
--set storageClass.name=nfs-client-mssql `
--namespace cla-mssql-nfs
```