TAR_FILENAME=gitlab-backup-`date +%Y%m%d-%H%M%S`;
GITLAB_FOLDER=/dock/gitlab;
TAR_FOLDER=/dock;

echo "Backup Gitlab Volume Folder[" + ${GITLAB_FOLDER} + "] to file [${TAR_FOLDER}/${TAR_FILENAME}]";

tar -zcvf ${TAR_FOLDER}/${TAR_FILENAME} ${GITLAB_FOLDER}