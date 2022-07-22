# Legenda

- Spilo (taken from the Georgian word for 'Elephant')
	+ https://github.com/zalando/spilo
	+ docker container that provides PostgreSQL and Patroni bundled together

- Governor
	+ https://github.com/compose/governor
	+ A template for PostgreSQL HA with _etcd_
	+ now **deprecated**

- Patroni
	+ https://github.com/zalando/patroni
	+ is a template for PostgreSQL HA, written in Python and based on configuration store like _etcd, ZooKeepr or Kubernetes_
	+ forked from _Governor_

- Postgres Operator
	+ https://github.com/zalando/postgres-operator
	+ easy to run HA PostgreSQL cluster on Kubernetes powered by Patroni
	+ PITR taken with _pg\_basebackup_ _WAL-E_ via _Spilo_