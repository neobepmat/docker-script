TC_FOLDER=/dock/tc

echo Creating folders for data, configuration and basebackup
mkdir -p $TC_FOLDER;

mkdir -p $TC_FOLDER/teamcity;

mkdir -p $TC_FOLDER/teamcity/data;
mkdir -p $TC_FOLDER/teamcity/logs;

mkdir -p $TC_FOLDER/postgres;

mkdir -p $TC_FOLDER/postgres/pg_data;
mkdir -p $TC_FOLDER/postgres/pg_backup;

echo Setting user and group to folder
chown -R 1000:1000 $TC_FOLDER/teamcity;
