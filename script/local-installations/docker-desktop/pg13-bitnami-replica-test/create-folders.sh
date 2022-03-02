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

mkdir -p $PG_FOLDER/pg13-settings;

mkdir -p $PG_FOLDER/pg13-archive;


echo Copy settings file
cp ./pg-master $PG_FOLDER/pg13-settings;
cp ./pg-slave $PG_FOLDER/pg13-settings;


echo MASTER ---------------------------------
echo Copy shell script for MASTER - PREINIT
cp ../../../postgres-common-scripts/000-create-folder-for-tablespaces-nopgdata.sh $PG_FOLDER/pg13-master-preinit;

echo Copy sql script for MASTER - INIT
cp ../../../postgres-common-scripts/010-create-tablespaces-nopgdata.sql $PG_FOLDER/pg13-master-init;
cp ../../../postgres-common-scripts/020-create-roles.sql $PG_FOLDER/pg13-master-init;

echo Copy configuration scripts
cp pg13conf-master/conf.d/pg-master.conf $PG_FOLDER/pg13-master-conf/conf.d/pg-master.conf


echo Setting user and group to folder
chown 1001:docker /Docker/pg -R