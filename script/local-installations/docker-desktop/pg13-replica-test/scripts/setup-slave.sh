#!/bin/bash

MASTER_HOSTNAME=$(cat /tmp/postgresql/pg-master | awk '{print $1}');
MASTER_PORT=$(cat /tmp/postgresql/pg-master | awk '{print $2}');
MASTER_PWD_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $3}');
MASTER_USER_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $4}');
MASTER_SLOT_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $5}');
MASTER_FOLDER_TABLESPACES=$(cat /tmp/postgresql/pg-master | awk '{print $6}');

SLAVE_HOSTNAME=$(cat /tmp/postgresql/pg-slave | awk '{print $1}');
SLAVE_PGDATA=$(cat /tmp/postgresql/pg-slave | awk '{print $4}');
SLAVE_FOLDER_TABLESPACES=$(cat /tmp/postgresql/pg-slave | awk '{print $5}');


echo Creating folder for User Tablespaces
mkdir -p ${SLAVE_FOLDER_TABLESPACES}

echo "Running pg_basebackup... from " ${MASTER_HOSTNAME} " to:" $SLAVE_HOSTNAME;
pg_basebackup -h $MASTER_HOSTNAME -p $MASTER_PORT -U $MASTER_USER_REPLICATOR -D $SLAVE_PGDATA --checkpoint=fast -R --slot=$MASTER_SLOT_REPLICATOR --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/BOD_TACO_TBS.NDF=$SLAVE_FOLDER_TABLESPACES/BOD_TACO_TBS.NDF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M00A.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M00A.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M00B.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M00B.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M01A.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M01A.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M01B.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M01B.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M04A.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M04A.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_M04B.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_M04B.DBF --tablespace-mapping=$MASTER_FOLDER_TABLESPACES/TACO_U.DBF=$SLAVE_FOLDER_TABLESPACES/TACO_U.DBF;


# echo "Writing settings for postgresql.conf file";
# cat > $SLAVE_PGDATA/postgresql.conf <<EOS
# wal_level = replica
# primary_conninfo = 'host=${MASTER_HOSTNAME} port=${MASTER_PORT} user=${MASTER_USER_REPLICATOR} password=${MASTER_PWD_REPLICATOR}'
# EOS

echo Set owner of ${PGDATA} to [postgres]
chown postgres:postgres ${PGDATA} -R

echo Set owner of [${SLAVE_FOLDER_TABLESPACES}] to user [postgres]
chown postgres:postgres ${SLAVE_FOLDER_TABLESPACES} -R

echo Set mode 700 to ${PGDATA} recursive
chmod 700 ${PGDATA} -R

echo Set mode 700 to ${SLAVE_FOLDER_TABLESPACES} recursive
chmod 700 ${SLAVE_FOLDER_TABLESPACES} -R


exec "$@"