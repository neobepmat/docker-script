# Docker commands

Running the container in detached mode
```
docker-compose up -d
```

Creating container with compose yaml not default filename
```
docker-compose -f <docker compose not default filename>.yml up
```

Rebuilding container after modifications on docker-compose file
>docker-compose -f <docker compose not default filename>.yml up -d --no-deps --build <service_name>

For PostgreSQL 13 TEST:
> docker-compose -f docker-compose-pg13test.yml up -d
---

Running shell script inside docker container
> cat local_file.sh | docker exec -i container_name bash
---

Cleaning Docker unused objects
Cleaning everything
> docker system prune
