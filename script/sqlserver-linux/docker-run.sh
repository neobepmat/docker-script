docker run --name sql2017e \
--env "ACCEPT_EULA=Y" \
--env "SA_PASSWORD=VivaLaRiga7GiorniSu7" \
--env "MSSQL_PID=Express" \
-p 9433:1433 \
--volume /Docker/sqlsrvr2017e/data/system:/var/opt/mssql \
--volume /Docker/sqlsrvr2017e/data/user:/var/opt/sqlserver \
-d \
mcr.microsoft.com/mssql/server:2017-latest-ubuntu