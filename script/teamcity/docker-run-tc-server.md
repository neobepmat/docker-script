docker run 
-it \
-d \
--name teamcity \
--publish 8111:8111 \
-u 1000:1000 \
--volume /Docker/teamcity/data:/data/teamcity_server/datadir \
--volume /Docker/teamcity/logs:/opt/teamcity/logs \
jetbrains/teamcity-server