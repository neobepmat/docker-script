# PostgreSQL configuration

Service configuration
> "C:\Program Files\PostgreSQL\9.6\bin\pg_ctl.exe" runservice -N "postgresql-x64-9.6" -D "C:\Program Files\PostgreSQL\9.6\data" -w

The PG_DATA has been relocated to the path
> C:\Program Files\PostgreSQL\9.6\data

Stop and Start should be executed via service

## Credentials

- main user
	+ postgres, pwd=postgresSQL2017

## How to

- Connect to PostgreSQL via psql 
	+ SET PGPASSWORD=<password>
	+ C:\Program Files\PostgreSQL\9.6\bin\psql.exe -U postgres -h localhost -p 5432