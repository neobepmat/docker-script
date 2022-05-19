echo "Creating folders for Postgres 13 volumes"
mkdir -p /Docker/pg13/data;
mkdir -p /Docker/pg13/conf;

chown mssql:docker /Docker/pg13 -r;
