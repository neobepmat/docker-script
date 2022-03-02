BASEBACKUP_DONE=/tmp/postgresql/.first-basebackup-done

MASTER_HOSTNAME=$(cat /tmp/postgresql/pg-master | awk '{print $1}');
MASTER_PORT=$(cat /tmp/postgresql/pg-master | awk '{print $2}');
MASTER_PWD_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $3}');
MASTER_USER_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $4}');
MASTER_SLOT_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $5}');
MASTER_FOLDER_TABLESPACES=$(cat /tmp/postgresql/pg-master | awk '{print $6}');

SLAVE_HOSTNAME=$(cat /tmp/postgresql/pg-slave | awk '{print $1}');
SLAVE_PGDATA=$(cat /tmp/postgresql/pg-slave | awk '{print $4}');


echo "Cleaning up old cluster directory" $SLAVE_PGDATA;
rm -rf ${SLAVE_PGDATA}/ '!(postmaster.pid)'
echo "Re-creating directory" $SLAVE_PGDATA;
mkdir ${SLAVE_PGDATA}


echo "Cleaning tablespace folder:" $MASTER_FOLDER_TABLESPACES;
mkdir $MASTER_FOLDER_TABLESPACES -p;
rm -rf $MASTER_FOLDER_TABLESPACES/*;


echo "Running pg_basebackup... from " ${MASTER_HOSTNAME} " to:" $SLAVE_HOSTNAME;
pg_basebackup -h $MASTER_HOSTNAME -p $MASTER_PORT -U $MASTER_USER_REPLICATOR -D $SLAVE_PGDATA --checkpoint=fast -R --slot=$MASTER_SLOT_REPLICATOR --tablespace-mapping=/usr/pg/usr_tblspcs/BOD_TACO_TBS.NDF=/usr/pg/usr_tblspcs/BOD_TACO_TBS.NDF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M00A.DBF=/usr/pg/usr_tblspcs/TACO_M00A.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M00B.DBF=/usr/pg/usr_tblspcs/TACO_M00B.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M01A.DBF=/usr/pg/usr_tblspcs/TACO_M01A.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M01B.DBF=/usr/pg/usr_tblspcs/TACO_M01B.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M04A.DBF=/usr/pg/usr_tblspcs/TACO_M04A.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_M04B.DBF=/usr/pg/usr_tblspcs/TACO_M04B.DBF --tablespace-mapping=/usr/pg/usr_tblspcs/TACO_U.DBF=/usr/pg/usr_tblspcs/TACO_U.DBF;


# echo "Creating postgresql.conf..."
# echo "hot_standby = on" >> ${SLAVE_PGDATA}/postgresql.conf
# echo "wal_level = replica" >> ${SLAVE_PGDATA}/postgresql.conf


echo "Writing settings for postgresql.conf file";
cat > /opt/bitnami/postgresql/conf/postgresql.conf <<EOS
hot_standby = on
primary_conninfo = 'host=${MASTER_HOSTNAME} port=${MASTER_PORT} user=${MASTER_USER_REPLICATOR} password=${MASTER_PWD_REPLICATOR}'
EOS