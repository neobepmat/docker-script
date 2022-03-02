PG_FOLDER=/Docker/pg

echo Creating folders for data, configuration and basebackup
mkdir -p $PG_FOLDER;

mkdir -p $PG_FOLDER/pg13-master-init;
mkdir -p $PG_FOLDER/pg13-slave-init;

mkdir -p $PG_FOLDER/pg13-master;
mkdir -p $PG_FOLDER/pg13-slave;

mkdir -p $PG_FOLDER/pg13-master-conf;
mkdir -p $PG_FOLDER/pg13-slave-conf;

mkdir -p $PG_FOLDER/pg13-settings;

mkdir -p $PG_FOLDER/pg13-archive;


echo Copy settings file
cp ./pg-master $PG_FOLDER/pg13-settings;
cp ./pg-slave $PG_FOLDER/pg13-settings;


echo MASTER ---------------------------------
echo Copy shell and sql script for MASTER - INIT
cp scripts/000-init-master.sh $PG_FOLDER/pg13-master-init;
cp scripts/010-create-tablespaces.sql $PG_FOLDER/pg13-master-init;
cp scripts/020-create-roles.sql $PG_FOLDER/pg13-master-init;
cp scripts/030-replica-settings-master.sql $PG_FOLDER/pg13-master-init;

echo Copy configuration scripts
cp conf/master/pg-hba-master.conf $PG_FOLDER/pg13-master-conf/pg_hba.conf


echo Set shell scripts as executable
chmod ugo+x $PG_FOLDER/pg13-master-init/000-init-master.sh;


echo Setting user and group to folder
chown 1001:docker /Docker/pg -R