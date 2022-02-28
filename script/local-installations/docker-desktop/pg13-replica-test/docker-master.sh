docker run --name pg13-master \
--env-file "pg13localenv-master" \
--network=replicanet \
--memory="1g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 6432:5432 \
--volume /Docker/pg/pg13-master:/var/lib/postgresql/data \
--volume /Docker/pg/pg13-master-init:/docker-entrypoint-initdb.d \
--volume /Docker/pg/pg13-master-conf/postgresql.conf:/etc/postgresql/postgresql.conf \
--volume /Docker/pg/pg13-archive:/archive \
--volume /Docker/pg/pg13-settings:/tmp/postgresql \
-d \
postgres:13.6