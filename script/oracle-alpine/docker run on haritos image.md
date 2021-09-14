# Running Oracle XE in docker container

## TL;DR
- Oracle SID = xe
- Listener = 1521
- SYS & SYSTEM password = password
- startupScripts folder
	+ volume mounted on SETUP folder for Oracle XE
	+ tablespaces creation for SharPlant database (checkout script _startupScripts\create-tablespaces.sql_)
	+ schema creation DBENG identified by "password"

## Docker run command
docker run --name oraclabuilder \
--shm-size=1g \
-p 1521:1521 -p 8080:8080 \
-e ORACLE_PWD=password \
-d \
-v /home/neobepmat/github/docker-script/script/oracle-alpine/startupScripts:/u01/app/oracle/scripts/setup \
haritos/11.2.0.2-xe