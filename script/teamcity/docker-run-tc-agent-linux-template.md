docker run \
-it \
-d \
--name <% agent name %>
-e SERVER_URL="172"  \ 
-v /Docker/tc/agents/<% agent name %>:/data/teamcity_agent/conf  \      
jetbrains/teamcity-minimal-agent
