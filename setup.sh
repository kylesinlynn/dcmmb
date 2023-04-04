#!/bin/bash

# Set up crontab to run backup script every hour
crontab -l > crontasks
echo "0 * * * * $(pwd)/src/backup_script.sh >> /var/log/backup_script.log 2>&1" >> crontasks
crontab crontasks
rm crontasks
