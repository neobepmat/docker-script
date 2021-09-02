# Postgres command inside container

Connecting to postgres inside the host
> psql  --host=<%docker service name%> --username=dbuser --dbname=todoapp

Connecting to "postgres" from outside
> psql --host=localhost --username=dbuser --dbname=todoapp