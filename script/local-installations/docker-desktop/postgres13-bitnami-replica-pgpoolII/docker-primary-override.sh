docker run \
-it \
--rm \
--name pgp_ovdn \
--volume postgres13-replica-pgpoolii_pgprimary_data:/bitnami/postgresql \
--env POSTGRESQL_REPLICATION_MODE=master \
--env POSTGRESQL_REPLICATION_USER=postgres \
--env POSTGRESQL_REPLICATION_PASSWORD=s3cret \
--env POSTGRESQL_PASSWORD=s3cret \
--env POSTGRESQL_DATABASE=test_db \
--entrypoint /bin/bash \
bitnami/postgresql:13.1.0