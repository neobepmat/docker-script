# README

This folder includes information about building a PostgreSQL Cluster with replica features and a Query Balancer like PgPoolII

The Docker Compose file has been taken from the URL
> https://www.refurbed.org/posts/load-balancing-sql-queries-using-pgpool/


## Scenario

Two PostgreSQL servers are created from Bitnami docker image.

Smart replication is activated, a the docker container `pgprimary` is elected as _MASTER_, the server `pgreplica` is elected as _SLAVE_

Both nodes listen to port `5432` but these are not exposed to the host machine while the container `pgpool` has the 5432 internal port redirected