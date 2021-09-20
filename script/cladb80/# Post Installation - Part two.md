# Post Installation - Part two

## SQL Server Express install

The folder
> %repository%/script/sqlserver-linux

includes a docker run command to execute a SQL Server 2017 Express edition based on Docker container.

The file
> docker-run.sh

contains the full command to run a container.
---


## Specs

The docker container _sql2017e_ expose the tcp port
> tcp 9433

the _sa_ user password is
> VivaLaRiga7GiorniSu7

the Sql Server system and user databases are mounted on the volume mount point
> /Docker/sqlsrvr2017e

the docker container runs within the _root_ user