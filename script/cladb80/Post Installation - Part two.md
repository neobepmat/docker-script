# Post Installation - Part two


## Files

All the files are available in the folder
> %repository%/script/sqlserver-linux


## Prerequisites to install Sql Server as root-less container

Follow the instructions in the file
> %repository%/script/sqlserver-linux/root-less installation.md


## SQL Server Express install

Includes a docker run command to execute a SQL Server 2019 Express edition based on Docker container.

The file
> docker-run-2019.sh

contains the full command to run a container.


## Specs

The docker container _sql2019e_ expose the tcp port
> tcp 9433

the _sa_ user password is
> VivaLaRiga7GiorniSu7

the Sql Server system and user databases are mounted on the volume mount point
> /Docker/sqlsrvr2019e

the docker container runs within the root-less user mssql