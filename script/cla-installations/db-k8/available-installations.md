# Available installations on DB-K8

This README contains information about the services installed on Kubernetes cluster `db-k8`.

## Postgres installations

### Postgres 14 based on Bitnami Helm (with Replication), PV on local storage

**This postgres cluster is just a test installation and shouldn't be used.**

Postgres 14 installation based on Bitnami Helm Chart for Postgres HA (3 replicas of Postgres 14, 1 Pgpool).

> https://github.com/bitnami/charts/tree/master/bitnami/postgresql-ha

The 3 replicas are created as usual, 1 master and 2 standby.

There isn't any automatic promote or demote.

The scripts for this installations are located in the folder 
`script-cla-operation/script/cla-installations/db-k8/postgres-ha-helm/14 local storage`

Namespace is `cla-pg-ha`

Three Persistent Volume have been created based on Local Storage (local folder with node affinity based on `db-node02`)
- /k8-pv/pg-ha-01
- /k8-pv/pg-ha-02
- /k8-pv/pg-ha-03

The storage class `cla-local-storage` has been created with _Immediate_ binding mode.

The `values.yaml` to customize the Helm chart has been copied and renamed as `values-14-3-0.yaml`

The postgres image used is 
> bitnami/postgresql-repmgr:14.3.0-debian-10-r20