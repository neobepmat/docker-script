## remove database files before running these scripts

# here .sh scripts
rm /Docker/pg9script/preinit/*.*

# here *.sql scripts
rm /Docker/pg9script/init/*.*

cp ../postgres-common-scripts/000-create-folder-for-tablespaces-nopgdata.sh /Docker/pg9script/preinit/

cp ../postgres-common-scripts/010-create-tablespaces-nopgdata.sql /Docker/pg9script/init/

cp ../postgres-common-scripts/020-create-roles.sql /Docker/pg9script/init/

## setting permissions
sudo chown 1001:docker /Docker/pg9 -R
sudo chown 1001:docker /Docker/pg9script -R
