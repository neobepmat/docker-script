docker run --name pg13-master \
--env-file "pg13localenv-master" \
--network=replicanet \
--memory="1g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 6432:5432 \
--volume /Docker/pg/pg13-master:/bitnami/postgresql \
--volume /Docker/pg/pg13-master-init:/docker-entrypoint-initdb.d \
--volume /Docker/pg/pg13-master-preinit:/docker-entrypoint-preinitdb.d \
--volume /Docker/pg/pg13-master-conf/:/bitnami/postgresql/conf/ \
--volume /Docker/pg/pg13-archive:/archive \
--volume /Docker/pg/pg13-settings:/tmp/postgresql \
-d \
bitnami/postgresql:13.4.0-debian-10-r19