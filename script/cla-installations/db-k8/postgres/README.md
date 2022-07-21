# Bitnami PostgreSQL for Kubernetes

This configuration deploys 2 Pods for Postgresql, version 13.7.

The service is listening on the TCP port 30002

## Main parameters

- Application Namespace
	+ cla-pg

The _Persistent Volume_ has a NodeAffinity on db-node01, the folder used is /k8-db/pg-ha

The default password for the user _postgres_ is _Abcd1234_