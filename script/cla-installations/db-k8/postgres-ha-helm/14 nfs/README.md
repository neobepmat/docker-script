# Bitnami PostgreSQL HA on Heml for Kubernetes with NFS dynamic provisioning

This configuration deploys 3 Pods for Postgresql in High Availability, version 14.3.

The service is listening on the TCP port 5432 via PGPOOL service.

The PV are exposed via NFS using a dynamic provisioner service _Kubernetes NFS Subdir External Provisioner_

> https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner

```language
NFS subdir external provisioner is an automatic provisioner that use your existing and already configured NFS server to support dynamic provisioning of Kubernetes Persistent Volumes via Persistent Volume Claims. Persistent volumes are provisioned as ${namespace}-${pvcName}-${pvName}.
```

## Installing NFS Subdir External Provisioner

With Helm, 
- installing repo

> $ helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/


- Install Helm chart

```language
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --create-namespace --namespace nfs-provisioner --set nfs.server=172.10.250.75 --set nfs.path=/volume1/k8-nsf/cla-postgres-ha/
```

The storage class _nfs-client_ is installed on your Kubernetes environment.


## Main parameters valid also for Helm

- Application Namespace
	+ cla-pg-nfs-ha

The _Persistent Volume_ and _Persistent Volume Claim_ must created manually before deploying the Helm chart

The Persistent Volume has a Node Affinity on _db-node01_ and the folder is _/k8-pv/pg-ha_

## How top deploy Bitnami Helm chart or PostgreSQL HA

> helm install cla-pg-nfs-ha bitnami/postgresql-ha -f values-14-3-0.yaml -n cla-pg-nfs-ha

To test the manifest to be deployed

> helm install cla-pg-nfs-ha --debug --dry-run bitnami/postgresql-ha -f values-14-3-0.yaml > logme


## Upgrade Helm Chart

> helm upgrade -f .\values-14-3-0.yaml cla-pg-nfs-ha bitnami/postgresql-ha -n cla-pg-nfs-ha


## Overridden parameters on _values.yaml_

- @param namespaceOverride String to fully override common.names.namespace
	+ cla-pg-nfs-ha
	
- @param postgresql.image.tag PostgreSQL with Repmgr image tag
	+ 14.3.0-debian-10-r20

- @param postgresql.image.debug Specify if debug logs should be enabled
	+ true


- @param persistence.enabled Enable data persistence
	+ true


- @param postgresql.podSecurityContext.fsGroup Group ID for the PostgreSQL with Repmgr filesystem
	+ 100
- @param pgpool.podSecurityContext.fsGroup Group ID for the Pgpool filesystem
	+ 100


- @param postgresql.password PostgreSQL password
	+ Abcd1234

- @param postgresql.repmgrPassword PostgreSQL Repmgr password
	+ password


- @param service.type Kubernetes service type (`ClusterIP`, `NodePort` or `LoadBalancer`)
	+ NodePort

- @param service.nodePorts.postgresql Kubernetes service nodePort
	+ "30001"

- @param pgpool.adminPassword Pgpool Admin password
	+ password
	
- @param persistence.storageClass Persistent Volume Storage Class
	+ "nfs-client"


## Fix for Headless service

To establish communication between pods, a fix has been provided

> Service.spec.publishNotReadyAddresses: true