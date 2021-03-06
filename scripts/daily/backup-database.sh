#!/bin/sh

BACKUP_FOLDER=/opt/mysql/backup
NOW=$(date '+%d')

GZIP=$(which gzip)
MYSQLDUMP=$(which mysqldump)

### MySQL Server Login info ###
MDB=$MYSQL_DATABASE
MHOST=$MYSQL_CONTAINER_NAME
MPASS=$MYSQL_PASSWORD
MUSER=$MYSQL_USER

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER

FILE=${BACKUP_FOLDER}/backup-${NOW}.sql.gz
$MYSQLDUMP --single-transaction -h $MHOST -u $MUSER --password="${MPASS}" --databases $MDB | $GZIP -9 > $FILE