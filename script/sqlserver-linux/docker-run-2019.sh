docker run --name sql2019e \
--env "ACCEPT_EULA=Y" \
--env "SA_PASSWORD=VivaLaRiga7GiorniSu7" \
--env "MSSQL_PID=Express" \
--memory="5g" \
--memory-swap="5g" \
--memory-reservation="4g" \
--memory-swappiness="0" \
-p 9433:1433 \
--volume /Docker/sqlsrvr2019e/data/system:/var/opt/mssql \
--volume /Docker/sqlsrvr2019e/data/user:/var/opt/sqlserver \
-d \
mcr.microsoft.com/mssql/server:2019-GDR1-ubuntu-16.04