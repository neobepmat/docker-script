# NFS Subdir Provisioner

For further instructions on how to install this storage provisioner, please refer to the docs in the folder
> -script-cla-operation/script/templates/helm charts/nfs subdir provisioner

## NFS configuration

Install Helm chart, in case the nsf-subdir has already been installed you have to specify a different storage class name and a different nfs path

```powershell
helm install `
nfs-subdir-external-provisioner `
nfs-subdir-external-provisioner/nfs-subdir-external-provisioner `
--set nfs.server=172.10.250.75 `
--set nfs.path=/volume1/k8-nsf/cla-pg-zal/ `
--set storageClass.name=nfs-pg-zal
```

```language
helm install nfs-subdir-external-provisioner-mssql nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=172.10.250.75 --set nfs.path=/volume1/k8-nsf/cla-mssql/ --set storageClass.name=nfs-client-mssql --set storageClass.provisionerName=k8s-sigs.io/nfs-subdir-external-provisioner-mssql
```

## NFS Testing mount command

Before any nfs mount test command, nfs helper must be installed
```
sudo apt install nfs-common
```

Do not forget to add special users to mount nfs resources.

For example, to share nfs resources from NAS Synology you need to share a user.

Actually, the user `db-k8` must exist in your WSL2 distribution to correctly mount the nfs shares.

I you need to create it, the UID must be the same with the UID on Nas Synology. In this specific case the uid is `uid=1028`

`sudo adduser -u 1200 db-k8`

```shell
sudo mkdir -p /nfs-mount

sudo chown 1028:100 /nfs-mount -R

sudo mount 172.10.250.75:/volume1/k8-nsf/kind-nfs /nfs-mount
```