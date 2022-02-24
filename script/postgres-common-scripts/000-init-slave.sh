BASEBACKUP_DONE=/tmp/postgresql/.first-basebackup-done

MASTER_HOSTNAME=$(cat /tmp/postgresql/pg-master | awk '{print $1}');
MASTER_PORT=$(cat /tmp/postgresql/pg-master | awk '{print $2}');
MASTER_PWD_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $3}');
MASTER_PGDATA=$(cat /tmp/postgresql/pg-master | awk '{print $4}');
MASTER_USER_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $5}');
MASTER_SLOT_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $6}');
MASTER_FOLDER_TABLESPACES=$(cat /tmp/postgresql/pg-master | awk '{print $7}');

SLAVE_HOSTNAME=$(cat /tmp/postgresql/pg-slave | awk '{print $1}');
SLAVE_PGDATA=$(cat /tmp/postgresql/pg-slave | awk '{print $4}');

echo "Cleaning up old cluster directory" $SLAVE_PGDATA"/data/*";
rm -rf ${SLAVE_PGDATA}/data/*

echo "Cleaning tablespace folder:" /usr/pg/user_tablespaces;
mkdir /usr/pg/user_tablespaces -p;
rm -rf /usr/pg/user_tablespaces/*;


echo "Running pg_basebackup... from " ${MASTER_HOSTNAME} " to:" $SLAVE_HOSTNAME;
pg_basebackup -h $MASTER_HOSTNAME -p $MASTER_PORT -U $MASTER_USER_REPLICATOR --pgdata=$SLAVE_PGDATA/data --format=plain --write-recovery-conf --slot=$MASTER_SLOT_REPLICATOR --wal-method=stream;


echo "Creating postgresql.conf..."
echo "hot_standby = on" >> ${SLAVE_PGDATA}/postgresql.conf

echo "Writing recovery.conf file";
cat > ${SLAVE_PGDATA}/recovery.conf <<EOS
standby_mode = 'on'
primary_conninfo = 'host=${MASTER_HOSTNAME} port=${MASTER_PORT} user=${MASTER_USER_REPLICATOR} password=${MASTER_PWD_REPLICATOR}'
trigger_file = '/tmp/postgresql.trigger'
EOS