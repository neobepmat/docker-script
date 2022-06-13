TC_FOLDER=/Docker/teamcity

echo Creating folders for data, configuration and basebackup
mkdir -p $TC_FOLDER;

mkdir -p $TC_FOLDER/data;
mkdir -p $TC_FOLDER/logs;

echo Setting user and group to folder
chown -R 1000:1000 $TC_FOLDER