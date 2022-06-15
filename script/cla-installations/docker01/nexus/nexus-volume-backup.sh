TAR_FILENAME=nexus-backup-`date +%Y%m%d-%H%M%S`.tar;
GITLAB_FOLDER=/dock/nexus;
TAR_FOLDER=/dock;

echo "Backup Nexus Volume Folder[" + ${GITLAB_FOLDER} + "] to file [${TAR_FOLDER}/${TAR_FILENAME}]";

tar -zcvf ${TAR_FOLDER}/${TAR_FILENAME} ${GITLAB_FOLDER}