# README - Sql Server on Kubernetes

Installation for SQL Server on Kubernetes, based on the internet article

> https://artifacthub.io/packages/helm/cloudnativeapp/mssql-linux


## Helm configuration

The chart has been locally deployed due to the necessary customizations.

- Dry Run Helm chart

> helm install --debug --dry-run cla-mssql mssqlhelm/

- Install chart

> helm install cla-mssql mssqlhelm/ --namespace cla-mssql -f mssqlhelm/values.yaml


## NFS configuration

- Install Helm chart, in case the nsf-subdir has already been installed you have to specify a different storage class name and a different nfs path

```language
helm install nfs-subdir-external-provisioner-mssql nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=172.10.250.75 --set nfs.path=/volume1/k8-nsf/cla-mssql/ --set storageClass.name=nfs-client-mssql --namespace cla-mssql-nfs
```

```language
helm install nfs-subdir-external-provisioner-mssql nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=172.10.250.75 --set nfs.path=/volume1/k8-nsf/cla-mssql/ --set storageClass.name=nfs-client-mssql --set storageClass.provisionerName=k8s-sigs.io/nfs-subdir-external-provisioner-mssql
 ```



## SQL Server secret

Generating the secret for SA_PASSWORD

> kubectl create secret generic mssql --from-literal=SA_PASSWORD="PerbaccoMiPiaciUnSacco!123"


## SQL Server configuration

The SQL Server configuration is managed via _values.yaml_ helm file. Also the files included in the _templates_ subfolder have been customized

- HADREnabled (in the file  _mssqlconfig.yaml_)
	+ false

- MSSQL_PID
	+ Express

## SA Password Retrieval

The sa password is a randomized in the secret.yaml file. To retrieve the password, perform the following steps once you install the helm chart.

> $ printf $(kubectl get secret --namespace cla-mssql mymssql-mssql-linux-secret -o jsonpath="{.data.sapassword}" | base64 --decode);echo