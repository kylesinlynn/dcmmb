#!/bin/bash

# Set the current date and time
DATE=$(date +%Y-%m-%d_%H-%M-%S_%:z)

# Set MySQL Values
MYSQL_DOCKER_CONTAINER=mysql-1
MYSQL_ROOT_PASSWORD=mysql-password

# Set MongoDB Values
MONGO_DOCKER_CONTAINER=mongodb-1
MONGO_DATABASE=mongo-db-name
MONGO_USERNAME=''
MONGO_PASSWORD=''

# Set up backup directory
BACKUP_DIR=/backups
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p $BACKUP_DIR
fi

# Backup MySQL database
echo "MySQL -> creating backup $DATE"
docker exec $MYSQL_DOCKER_CONTAINER sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' | gzip -c > "$BACKUP_DIR"/mysql_backup_$DATE.gz

# Backup MongoDB database
echo "Mongo -> creating backup $DATE"
docker exec $MONGO_DOCKER_CONTAINER mongodump --gzip --archive="$BACKUP_DIR"/mongo_backup_$DATE.gz --username=$MONGO_USERNAME --password=$MONGO_PASSWORD

# Delete old backups (keep only the latest upon count)
echo "Deleting Old Backups..."
cd /backups/
ls -t mysql_backup_* | awk 'NR>4' | xargs -I {} rm {}
ls -t mongo_backup_* | awk 'NR>4' | xargs -I {} rm {}

# Delete backups that are more than 3 days old
#find $BACKUP_DIR -type f -mtime +3 -exec rm {} \;