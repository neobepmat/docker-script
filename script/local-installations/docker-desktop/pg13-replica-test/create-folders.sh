PG_FOLDER=/Docker/pg

echo Creating folders for data, configuration and basebackup
mkdir -p $PG_FOLDER;

mkdir -p $PG_FOLDER/pg13-master-init;
mkdir -p $PG_FOLDER/pg13-slave-init;

mkdir -p $PG_FOLDER/pg13-master-preinit;
mkdir -p $PG_FOLDER/pg13-slave-preinit;

mkdir -p $PG_FOLDER/pg13-master;
mkdir -p $PG_FOLDER/pg13-slave;

mkdir -p $PG_FOLDER/pg13-master-conf/conf.d;
mkdir -p $PG_FOLDER/pg13-slave-conf/conf.d;

mkdir -p $PG_FOLDER/pg13-settings;


echo Copy settings file
cp ./pg-master $PG_FOLDER/pg13-settings;
cp ./pg-slave $PG_FOLDER/pg13-settings;


echo Copy sql script for MASTER
cp ../../../postgres-common-scripts/010-create-tablespaces-nopgdata.sql $PG_FOLDER/pg13-master-init;
cp ../../../postgres-common-scripts/020-create-roles.sql $PG_FOLDER/pg13-master-init;
cp ../../../postgres-common-scripts/030-replica-settings-master.sql $PG_FOLDER/pg13-master-init;

# echo Copy sql script for SLAVE
# cp ../../../postgres-common-scripts/020-create-roles.sql $PG_FOLDER/pg13-slave-init;


echo Copy shell script for MASTER
cp ../../../postgres-common-scripts/000-create-folder-for-tablespaces-nopgdata.sh $PG_FOLDER/pg13-master-preinit;


echo Copy shell script for SLAVE
cp ../../../postgres-common-scripts/000-init-slave.sh $PG_FOLDER/pg13-slave-preinit;


echo Copy configuration scripts
cp pg13conf-master/pg-hba-master.conf $PG_FOLDER/pg13-master-conf/pg_hba.conf
cp pg13conf-master/conf.d/pg-master.conf $PG_FOLDER/pg13-master-conf/conf.d/pg-master.conf


#cp pg13conf-slave/conf.d/pg-slave.conf $PG_FOLDER/pg13-slave-conf/conf.d/pg-slave.conf


echo Setting user and group to folder
chown 1001:docker /Docker/pg -R