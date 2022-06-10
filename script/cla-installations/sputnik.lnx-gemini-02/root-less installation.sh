PG_FOLDER=/docker/pg

echo Creating folders for data, configuration and basebackup
mkdir -p $PG_FOLDER;

mkdir -p $PG_FOLDER/sqlsrvr2019e;
mkdir -p $PG_FOLDER/sqlsrvr2019e/data;
mkdir -p $PG_FOLDER/sqlsrvr2019e/data/system;
mkdir -p $PG_FOLDER/sqlsrvr2019e/data/user;


chown 10001:docker $PG_FOLDER/sqlsrvr2019e/ -R