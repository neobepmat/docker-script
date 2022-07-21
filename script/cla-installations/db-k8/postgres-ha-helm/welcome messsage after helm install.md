NAME: cla-pg-ha
LAST DEPLOYED: Fri Jun 24 12:18:40 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: postgresql-ha
CHART VERSION: 9.1.8
APP VERSION: 14.4.0
** Please be patient while the chart is being deployed **
PostgreSQL can be accessed through Pgpool via port 5432 on the following DNS name from within your cluster:

    cla-pg-ha-postgresql-ha-pgpool.default.svc.cluster.local

Pgpool acts as a load balancer for PostgreSQL and forward read/write connections to the primary node while read-only connections are forwarded to standby nodes.

To get the password for "postgres" run:

    export POSTGRES_PASSWORD=$(kubectl get secret --namespace default cla-pg-ha-postgresql-ha-postgresql -o jsonpath="{.data.postgresql-password}" | base64 -d)

To get the password for "repmgr" run:

    export REPMGR_PASSWORD=$(kubectl get secret --namespace default cla-pg-ha-postgresql-ha-postgresql -o jsonpath="{.data.repmgr-password}" | base64 -d)

To connect to your database run the following command:

    kubectl run cla-pg-ha-postgresql-ha-client --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql-repmgr:13.7.0-debian-11-r7 --env="PGPASSWORD=$POSTGRES_PASSWORD"  \
        --command -- psql -h cla-pg-ha-postgresql-ha-pgpool -p 5432 -U postgres -d postgres

To connect to your database from outside the cluster execute the following commands:

    export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
    export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services cla-pg-ha-postgresql-ha-pgpool
    PGPASSWORD="$POSTGRES_PASSWORD" psql -h $NODE_IP -p $NODE_PORT -U postgres -d postgres