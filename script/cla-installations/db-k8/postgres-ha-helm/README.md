# Bitnami PostgreSQL HA on Heml for Kubernetes

This configuration deploys 3 Pods for Postgresql in High Availability, versione 13.7.

The service is listening on the TCP port 5432

## Main parameters valid also for Helm

- Application
	+ cla-pg-ha

The _Persistent Volume_ and _Persistent Volume Claim_ must created manually before deploying the Helm chart


## How top deploy Bitnami Helm chart or PostgreSQL HA

> helm install cla-pg-ha bitnami/postgresql-ha -f values-13-7-0.yaml

To test the manifest to be deployed

> helm install cla-pg-ha --debug --dry-run bitnami/postgresql-ha -f values-13-7-0.yaml > logme

## Overridden parameters on _values.yaml_

- @param namespaceOverride String to fully override common.names.namespace
	+ cla-pg-ha
	
- @param postgresql.image.tag PostgreSQL with Repmgr image tag
	+ 13.7.0-debian-11-r7

- @param postgresql.postgresPassword PostgreSQL password for the `postgres` user when `username` is not `postgres`
	+ Abcd1234
 
- @param postgresql.initdbScripts Dictionary of initdb scripts
	+ {000: ../script/000-create-folder-for-tablespaces-nopgdata.sh, 001: ../script/010-create-tablespaces-nopgdata.sql, 002: ../script/020-create-roles.sql}

- @param persistence.enabled Enable data persistence
	+ true

- @param persistence.existingClaim A manually managed Persistent Volume and Claim
	+ cla-pg-ha-pvc


- @param service.type Kubernetes service type (`ClusterIP`, `NodePort` or `LoadBalancer`)
	+ NodedPort

- @param service.nodePorts.postgresql Kubernetes service nodePort
	+ "6432"