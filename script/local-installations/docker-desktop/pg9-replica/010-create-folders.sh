PG_FOLDER=/Docker/pg9

echo Creating folders for data, configuration and basebackup
mkdir -p $PG_FOLDER;

mkdir -p $PG_FOLDER/pg-master-init;
mkdir -p $PG_FOLDER/pg-slave-init;

mkdir -p $PG_FOLDER/pg-master;
mkdir -p $PG_FOLDER/pg-slave;

mkdir -p $PG_FOLDER/pg-master-conf;
mkdir -p $PG_FOLDER/pg-slave-conf;

mkdir -p $PG_FOLDER/pg-settings;

mkdir -p $PG_FOLDER/pg-archive-master;


echo Copy settings file
cp ./pg-master $PG_FOLDER/pg-settings;
cp ./pg-slave $PG_FOLDER/pg-settings;


echo MASTER ---------------------------------
echo Copy shell and sql script for MASTER - INIT
cp scripts/master/000-setup-master.sh $PG_FOLDER/pg-master-init;
cp scripts/master/010-create-tablespaces.sql $PG_FOLDER/pg-master-init;
cp scripts/master/020-create-roles.sql $PG_FOLDER/pg-master-init;
cp scripts/master/030-replica-settings-master.sql $PG_FOLDER/pg-master-init;
cp scripts/master/040-create-slot.sql $PG_FOLDER/pg-master-init;


echo Set shell scripts as executable
chmod ugo+x $PG_FOLDER/pg-master-init/000-setup-master.sh;


echo Setting user and group to folder [${PG_FOLDER}]
chown 999:docker ${PG_FOLDER} -R

echo Setting user and group to folder [${PG_FOLDER}/pg-master and ${PG_FOLDER}/pg-slave]
chown 999:999 ${PG_FOLDER}/pg-master -R
chown 999:999 ${PG_FOLDER}/pg-slave -R

chown 999:999 ${PG_FOLDER}/pg-archive-master -R
