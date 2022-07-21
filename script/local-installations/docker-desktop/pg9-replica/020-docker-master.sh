docker run \
-d \
--name pg9-master \
--env-file "pg9localenv-master" \
--network=replicanet \
--memory="1g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 6432:5432 \
--volume /Docker/pg9/pg-archive-master:/archive-master \
--volume /Docker/pg9/pg-master:/var/lib/postgresql/data \
--volume /Docker/pg9/pg-master-init:/docker-entrypoint-initdb.d \
--volume /Docker/pg9/pg-settings:/tmp/postgresql \
--volume $PWD/conf/master/pg-hba-master.conf:/tmp/postgresql/pg_hba.conf \
--volume $PWD/conf/master/postgresql-master-redux.conf:/etc/postgresql/postgresql.conf \
postgres:9.6 postgres -c 'config_file=/etc/postgresql/postgresql.conf'