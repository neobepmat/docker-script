 docker run \
 -d -P --shm-size=1g \
 -p 1521:1521 -p 8085:8080 \
 --name claorabuild \
 --restart no \
 orapatchbuilder
