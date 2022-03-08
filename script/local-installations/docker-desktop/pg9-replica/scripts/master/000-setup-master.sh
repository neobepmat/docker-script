#!/bin/bash

MASTER_HOSTNAME=$(cat /tmp/postgresql/pg-master | awk '{print $1}');
MASTER_PORT=$(cat /tmp/postgresql/pg-master | awk '{print $2}');
MASTER_PWD_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $3}');
MASTER_USER_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $4}');
MASTER_SLOT_REPLICATOR=$(cat /tmp/postgresql/pg-master | awk '{print $5}');
MASTER_FOLDER_TABLESPACES=$(cat /tmp/postgresql/pg-master | awk '{print $6}');
MASTER_PGDATA=$(cat /tmp/postgresql/pg-master | awk '{print $7}');

cd $MASTER_PGDATA;

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

echo Set owner of /archive to [postgres]
chmod 700 /archive-master
chown postgres:postgres /archive-master -R

echo Clearing pg_hba.conf file content
> /var/lib/postgresql/data/pg_hba.conf

echo Rebuilding pg_hba.conf file
cp /tmp/postgresql/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf