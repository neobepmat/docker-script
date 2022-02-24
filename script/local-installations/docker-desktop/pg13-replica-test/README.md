# Test: Postgres Replication

This test creates two different Postgres instances.
The MASTER has a listening port on 6432, the SLAVE on the port 7432

## Settings
Settings are available for Master and Slave

- pg-master
	+ settings for MASTER
	+ file format:
		* "hostname" "postgres port" "password for postgres user" "local folder where pgbasebackup result is stored"
- pg-slave
	+ settings for SLAVE
	+ file format:
		* "hostname" "postgres port" "password for postgres user" "PGDATA folder"

## Files

- create-network.sh
	+ create a network used to collect master and slave postgres containers
- create-folders.sh
	+ create all the required folders to install two PostgreSQL databases
- remove-slave-db.sh
	+ clean all slave folders
- docker-master.sh
	+ the docker run command to create the Master container
- docker-slave.sh
	+ the docker run command to create the Slave container
	
Further information on sql and config files are available into the file _create-folders.sh_.
SQL scripts are generally available into the folder _script/postgres-common-scripts_.
	

## Miscellaneous

The Log Level for internal server messages has been set to DEBUG5 for MASTER and SLAVE either.


## Starting containers

Set the executable flag of the scripts
```language
chmod ugo+x docker-master.sh
chmod ugo+x docker-slave.sh
chmod ugo+x create-network.sh
chmod ugo+x create-folders.sh
chmod ugo+x remove-slave-db.sh
```

Create the docker network
> ./create-network.sh

Create the volume structure and copy the sh,sql scripts
> sudo ./create-folders.sh

To initialize the MASTER composition, please type the command:
> ./docker-master.sh

To initialize the SLAVE composition, please type the command:
> ./docker-slave.sh

While testing this scripts, you might want to reset the SLAVE folders
> sudo ./remove-slave-db.sh


## Creating MASTER basebackup

Open a bash shell on MASTER
> docker exec -it <container name> /bin/bash

A folder /basebackup has already been created on MASTER container during the initialization

pg_basebackup with the plain format will try to save tablespaces in the same place as on the database server (the -D option only specifies the location of the data directory). To backup data from a tablespace to a different location, you have to use the option --tablespace-mapping=olddir=newdir. You can use this option more than once for multiple tablespaces.

For M04 tables, hereunder the list of existing tablespaces:
```language
"/usr/pg/user_tablespaces/BOD_TACO_TBS.NDF";
"/usr/pg/user_tablespaces/TACO_M00A.DBF";
"/usr/pg/user_tablespaces/TACO_M00B.DBF";
"/usr/pg/user_tablespaces/TACO_M01A.DBF";
"/usr/pg/user_tablespaces/TACO_M01B.DBF";
"/usr/pg/user_tablespaces/TACO_M04A.DBF";
"/usr/pg/user_tablespaces/TACO_M04B.DBF";
"/usr/pg/user_tablespaces/TACO_U.DBF";
```

These tablespaces are relocated in the folder
> /usr/pg_basebackup/user_tablespaces/

Perform a basebackup with tablespaces relocation
> pg_basebackup -D /basebackup -S replication_slot_slave1 -X stream -P -U replicator -Fp -R --tablespace-mapping=/usr/pg/user_tablespaces/BOD_TACO_TBS.NDF=/usr/pg_basebackup/user_tablespaces/BOD_TACO_TBS.NDF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_M00A.DBF=/usr/pg_basebackup/user_tablespaces/TACO_M00A.DBF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_M01A.DBF=/usr/pg_basebackup/user_tablespaces/TACO_M01A.DBF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_M01B.DBF=/usr/pg_basebackup/user_tablespaces/TACO_M01B.DBF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_M04A.DBF=/usr/pg_basebackup/user_tablespaces/TACO_M04A.DBF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_M04B.DBF=/usr/pg_basebackup/user_tablespaces/TACO_M04B.DBF --tablespace-mapping=/usr/pg/user_tablespaces/TACO_U.DBF=/usr/pg_basebackup/user_tablespaces/TACO_U.DBF