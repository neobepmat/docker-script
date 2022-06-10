PG_FOLDER=/docker/pg

echo Creating folders for data, configuration and basebackup
mkdir -p $PG_FOLDER;

mkdir -p $PG_FOLDER/pg9-data;
mkdir -p $PG_FOLDER/pg13-data;

mkdir -p $PG_FOLDER/pg9-init;
mkdir -p $PG_FOLDER/pg13-init;

mkdir -p $PG_FOLDER/pg9-preinit;
mkdir -p $PG_FOLDER/pg13-preinit;

mkdir -p $PG_FOLDER/pg9-conf;
mkdir -p $PG_FOLDER/pg13-conf;

echo MASTER ---------------------------------
echo Copy shell script for PREINIT
cp ./000-create-folder-for-tablespaces-nopgdata.sh $PG_FOLDER/pg9-preinit;
cp ./000-create-folder-for-tablespaces-nopgdata.sh $PG_FOLDER/pg13-preinit;

echo Copy sql script for INIT
cp ./010-create-tablespaces-nopgdata.sql $PG_FOLDER/pg9-init;
cp ./010-create-tablespaces-nopgdata.sql $PG_FOLDER/pg13-init;
cp ./020-create-roles.sql $PG_FOLDER/pg9-init;
cp ./020-create-roles.sql $PG_FOLDER/pg13-init;

echo Setting user and group to folder
chown 1001:docker $PG_FOLDER -R