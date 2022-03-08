#!/bin/bash

cd /var/lib/postgresql/data;

create_directory () {
	if [[ -d "$1" ]]
	then
	    echo "$1 exists on your filesystem."
	else
		mkdir $1;
	fi
}

create_directory "BOD_TACO_TBS.NDF";

create_directory "TACO_M00A.DBF";

create_directory "TACO_M00B.DBF";

create_directory "TACO_M01A.DBF";

create_directory "TACO_M01B.DBF";

create_directory "TACO_M04A.DBF";

create_directory "TACO_M04B.DBF";

create_directory "TACO_U.DBF";

echo Clearing pg_hba.conf file content
> /var/lib/postgresql/data/pg_hba.conf

echo Rebuilding pg_hba.conf file
cat << EOF >> /var/lib/postgresql/data/pg_hba.conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust

# IPv4 local connections:
host    all             all             127.0.0.1/32            trust

# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all              0.0.0.0/0              trust
host    replication     replicator      0.0.0.0/0              trust
host all all all md5
EOF

chown postgres:postgres /archive -R
