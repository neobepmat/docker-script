# Test: Postgres 9.6 Replication, based on Postgres official Docker images

Official URL
> https://hub.docker.com/_/postgres

The *postgres:9.6* has been used.

This test creates two different Postgres instances.
The MASTER has a listening port on 6432, the SLAVE on the port 7432.
For internal communication both containers use the default postgres TCP port 5432.

For this example, the user tablespaces are relocated in the PGDATA folder for the MASTER and within the path */usr/pg/usr_tblspcs* for the SLAVE.

The local path used to persist docker volumes has been set to
> /Docker/pg9

## Settings
Settings are available for Master and Slave

- pg-master
	+ settings for MASTER
	+ file format:
		* "hostname" "postgres port" "password for postgres user" "Replication Slot" "User tablespaces folder" "PGDATA folder"
- pg-slave
	+ settings for SLAVE
	+ file format:
		* "hostname" "postgres port" "password for postgres user" "PGDATA folder" "TABLESPACES folder"

## Files

- create-network.sh
	+ create a Docker network used by master and slave postgres containers
- create-folders.sh
	+ create all the required folders to install two PostgreSQL databases
- remove-slave-db.sh
	+ clean all slave folders
- dockerfile-master
	+ the dockerfile to build the pg9-slave:1.0 Docker image
- docker-master-customimage.sh
	+ the docker run command to create the Slave container based on the custom image *pg13-slave:1.0*
- dockerfile-slave
	+ the dockerfile to build the pg9-slave:1.0 Docker image
- docker-slave-customimage.sh
	+ the docker run command to create the Slave container based on the custom image *pg13-slave:1.0*
- pg13localenv-master
	+ environment variables used by MASTER
- pg13localenv-slave
	+ environment variables used by SLAVE
	
Further information on sql and config files are available into the file _create-folders.sh_.
SQL scripts are generally available into the folder _script/postgres-common-scripts_.
	

## Miscellaneous
The Log Level for internal server messages has been set to DEBUG5 for MASTER and SLAVE either.


## How to run the MASTER and SLAVE containers
- set the executable flag on shell scripts
- create a custom Docker network
- clean all the existing folders in the folder /Docker/pg9
- build the pg9-master docker image
- run the MASTER container
- build the pg9-slave docker image
- run the SLAVE container


## Starting containers

Set the executable flag of the scripts
```language
chmod ugo+x ./docker-master.sh;
chmod ugo+x ./docker-slave-customimage.sh;
chmod ugo+x ./create-network.sh;
chmod ugo+x ./create-folders.sh;
chmod ugo+x ./remove-slave-db.sh;
```

Create the docker network
> ./create-network.sh

Create the volume structure and copy the sh,sql scripts
> sudo ./create-folders.sh

Initializing the MASTER container
> ./docker-master.sh

Building the custom docker image pg13-slave
> docker build -t pg9-slave:%version% -f dockerfile-slave .

Initializing the SLAVE container
> ./docker-slave-customimage.sh

During the TEST phase, resetting all the SLAVE folders in /Docker/pg
> sudo ./remove-slave-db.sh


## Creating MASTER basebackup on SLAVE
After the MASTER container has been initialized and started, you can initialize the SLAVE container.
While initializing, a pg_basebackup command on MASTER is executed and the PGDATA folder of the SLAVE is synchronized with MASTER information. 