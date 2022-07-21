# Kubernetes Cluster, DB-K8

This README contains information about the services installed on Kubernetes cluster `db-k8`.

## Main

The main controller (control plane) is _db-k8_, this machine is joined to _cla.cl-grp.local_ domain.

```
cla.cl-grp.local
  type: kerberos
  realm-name: CLA.CL-GRP.LOCAL
  domain-name: cla.cl-grp.local
  configured: kerberos-member
  server-software: active-directory
  client-software: sssd
  required-package: sssd-tools
  required-package: sssd
  required-package: libnss-sss
  required-package: libpam-sss
  required-package: adcli
  required-package: samba-common-bin
  login-formats: %U@cla.cl-grp.local
  login-policy: allow-realm-logins
```

## Nodes

There are 3 available nodes, `db-node01, db-node02, db-node03`

## Postgres installations

There are different Postgres installations on the `db-k8` Kubernetes cluster

### Postgres 14 based on Bitnami Helm (with Replication), PV on NFS

**This postgres cluster is just a test installation and shouldn't be used.**

Postgres 14 installation based on Bitnami Helm Chart for Postgres HA (3 replicas of Postgres 14, 1 Pgpool).

> https://github.com/bitnami/charts/tree/master/bitnami/postgresql-ha

The 3 replicas are created as usual, 1 master and 2 standby.

There isn't any automatic promote or demote.

The scripts for this installations are located in the folder 
`script-cla-operation/script/cla-installations/db-k8/postgres-ha-helm/14 nfs`

Namespace is `cla-pg-nfs-ha`

The Persistent Volume are automatically provisioned based on the storage class `nfs-client`, provided by the Helm chart `NFS Subdir Provisioner`

NFS storage resources requires `nfs-common` package to be successfully mounted on worker nodes.

The storage class `nfs-client` has been created with _Immediate_ binding mode.

The `values.yaml` to customize the Helm chart has been copied and renamed as `values-14-3-0.yaml`

The postgres image used is 
> bitnami/postgresql-repmgr:14.3.0-debian-10-r20


## Microsoft SQL Server installations

### SQL Server 2019 Express based on Microsoft Helm, PV on NFS

SQL Server Express 2019 installation based on Microsoft Helm Chart.

> https://artifacthub.io/packages/helm/cloudnativeapp/mssql-linux

The scripts for this installations are located in the folder 
`script-cla-operation/script/cla-installations/db-k8/sqlserver`

Namespace is `cla-mssql-nfs`

The Persistent Volume are automatically provisioned based on the storage class `nfs-client-mssql`, provided by the Helm chart `NFS Subdir Provisioner`

NFS storage resources requires `nfs-common` package to be successfully mounted on worker nodes.

The storage class `nfs-client-mssql` has been created with _Immediate_ binding mode.

The Helm chart is available in the subfolder `mssqlhelm`. A customized version of the `values.yaml` helm chart file is `values-custom.yaml` in the current folder.

The postgres image used is 
> microsoft/mssql-server-linux:2019-CU16-GDR1-ubuntu-20.04