# Kubernetes Cluster

https://adamtheautomator.com/postgres-to-kubernetes/

## Main

The main controller is _db-k8_, this machine is joined to _cla.cl-grp.local_ domain.

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

## Nodes

There are two available nodes

## Postgres

The postgres image used is 
> bitnami/postgresql:13.7.0-debian-11-r7