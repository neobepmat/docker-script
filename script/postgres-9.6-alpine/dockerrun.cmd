docker run -p 6432:5432 --name pgsql96 -e POSTGRES_PASSWORD=password -v /c/docker-data/postgres-9-6-alpine/:/var/lib/postgresql/data -d postgres:9.6-alpine