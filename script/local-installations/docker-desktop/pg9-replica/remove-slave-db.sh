PG_FOLDER=/Docker/pg9

echo Removing SLAVE folders database, configuration
rm -rf $PG_FOLDER/pg-slave;
rm -rf $PG_FOLDER/pg-slave-conf;
rm -rf $PG_FOLDER/pg-slave-init;
