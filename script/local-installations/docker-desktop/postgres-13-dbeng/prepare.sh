echo "Creating folders for Postgres 13 volumes"

mkdir -p /Docker/pg13/data;
mkdir -p /Docker/pg13/conf;
mkdir -p /Docker/pg13/preinitdb;
mkdir -p /Docker/pg13/initdb;

cp ./tablespaces.sh /Docker/pg13/preinitdb;
cp ./scripts.sql /Docker/pg13/initdb;

chown 1001:docker /Docker/pg13 -R;
