PG_FOLDER=/Docker/pg

echo Removing SLAVE folders database, configuration
rm -rf $PG_FOLDER/pg13-slave;
rm -rf $PG_FOLDER/pg13-slave-conf;
rm -rf $PG_FOLDER/pg13-slave-init;
