docker run --name pg13-slave-customimage \
--env-file "pg13localenv-slave" \
--network=replicanet \
--memory="1g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 7432:5432 \
--volume /Docker/pg/pg13-archive:/archive \
--volume /Docker/pg/pg13-slave:/var/lib/postgresql/data \
--volume /Docker/pg/pg13-settings:/tmp/postgresql \
-d \
pg13-slave:1.0