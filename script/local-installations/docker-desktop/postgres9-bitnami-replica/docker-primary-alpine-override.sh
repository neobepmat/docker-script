docker run \
-it \
--rm \
--name pgp_ovdn \
--volume postgres9-replica_pgprimary_data:/bitnami/postgresql \
--entrypoint sh \
alpine:latest