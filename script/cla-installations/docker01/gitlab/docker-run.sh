docker run \
--restart always \
--detach \
--name CLAGitlab \
--hostname docker-01.cla.cl-grp.local \
--memory=10g \
--memory-reservation=5g \
--publish 4431:443 --publish 8082:80 --publish 222:22 \
--volume /dock/gitlab/config:/etc/gitlab \
--volume /dock/gitlab/logs:/var/log/gitlab \
--volume /dock/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce:14.9.5-ce.0