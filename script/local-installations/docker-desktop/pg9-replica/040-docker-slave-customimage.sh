docker run \
--name pg9-slave-customimage \
-d \
--env-file "pg9localenv-slave" \
--network=replicanet \
--memory="1g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 7432:5432 \
--volume /Docker/pg9/pg-archive-master:/archive-master \
--volume /Docker/pg9/pg-slave:/var/lib/postgresql/data \
--volume $PWD/conf/slave/postgresql-slave-redux.conf:/etc/postgresql/postgresql.conf \
--volume /Docker/pg9/pg-settings:/tmp/postgresql \
pg9-slave:1.0 -c 'config_file=/etc/postgresql/postgresql.conf' 