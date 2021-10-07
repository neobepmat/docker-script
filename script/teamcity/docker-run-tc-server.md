docker run 
-it \
-d \
--name teamcity \
-u root \
-v /Docker/tc/data:/data/teamcity_server/datadir \
-v /Docker/tc/logs:/opt/teamcity/logs \
-p 8111:8111 \
jetbrains/teamcity-minimal-agent:2021.1.3