#!/usr/bin/bash
HOME=/home/prokop
~/scripts/backup/packup.sh &&
echo zipping backuplist &&
date > ~/backuptime &&
zip ~/backup.zip $(cat ~/backuplist) ~/backuptime ~/backuplist -r 1> /dev/null &&
du ~/backup.zip -h &&
echo uploading backup &&
rsync ~/backup.zip prokop@randacek.dev:/home/prokop/backups/$(cat /etc/hostname)/ --progress &&
rm ~/backup.zip &&
echo done
