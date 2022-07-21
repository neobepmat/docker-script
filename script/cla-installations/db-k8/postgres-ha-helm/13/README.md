# Main parameters for customizing VALUES.YAML

- Application Namespace
	+ cla-pg-ha

The _Persistent Volume_ and _Persistent Volume Claim_ must created manually before deploying the Helm chart

The Persistent Volume has a Node Affinity on _db-node01_ and the folder is _/k8-pv/pg-ha_

## How top deploy Bitnami Helm chart or PostgreSQL HA

> helm install cla-pg-ha bitnami/postgresql-ha -f values-13-7-0.yaml -n cla-pg-ha

To test the manifest to be deployed

> helm install cla-pg-ha --debug --dry-run bitnami/postgresql-ha -f values-13-7-0.yaml > logme


## Upgrade Helm Chart

> helm upgrade -f .\values-13-7-0.yaml cla-pg-ha bitnami/postgresql-ha -n cla-pg-ha


## Overridden parameters on _values.yaml_

- @param namespaceOverride String to fully override common.names.namespace
	+ cla-pg-ha
	
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


- @param postgresql.initdbScripts Dictionary of initdb scripts
	+ {000: ../script/000-create-folder-for-tablespaces-nopgdata.sh, 001: ../script/010-create-tablespaces-nopgdata.sql, 002: ../script/020-create-roles.sql}


- @param persistence.existingClaim A manually managed Persistent Volume and Claim
	+ cla-pg-ha-pvc


- @param service.type Kubernetes service type (`ClusterIP`, `NodePort` or `LoadBalancer`)
	+ NodePort

- @param service.nodePorts.postgresql Kubernetes service nodePort
	+ "30000"

	
- @param pgpool.adminPassword Pgpool Admin password
	+ password
	
- @param postgresql.pgHbaTrustAll Configures PostgreSQL HBA to trust every user
	+ true

- @param persistence.storageClass Persistent Volume Storage Class
	+ "cla-local-storage"

- @param postgresql.pgHbaConfiguration PostgreSQL client authentication configuration
	+ pgHbaConfiguration: |-
	+ local all all trust
	+ host  all  all 0.0.0.0/0 trust
