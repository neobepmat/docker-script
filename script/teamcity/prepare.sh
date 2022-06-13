TC_FOLDER=/Docker/teamcity

echo Creating folders for data, configuration and basebackup
mkdir -p $TC_FOLDER;

mkdir -p $TC_FOLDER/data;
mkdir -p $TG_FOLDER/logs;

echo Setting user and group to folder
chown 1000:1000 $TC_FOLDER -R;
