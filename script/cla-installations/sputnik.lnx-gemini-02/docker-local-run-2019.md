docker run --name sql2019e \
--env "ACCEPT_EULA=Y" \
--env "SA_PASSWORD=VivaLaRiga7GiorniSu7" \
--env "MSSQL_PID=Express" \
--memory="2g" \
--memory-swap="1g" \
--memory-reservation="1g" \
--memory-swappiness="0" \
-p 9433:1433 \
--volume /docker/sqlsrvr/sqlsrvr2019e/data/system:/var/opt/mssql \
--volume /docker/sqlsrvr/sqlsrvr2019e/data/user:/var/opt/sqlserver \
-d \
mcr.microsoft.com/mssql/server:2019-latest