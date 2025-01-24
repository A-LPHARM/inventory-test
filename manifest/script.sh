#!/bin/bash

# Set the timestamp for the backup directory
TIMESTAMP=$(date +"%F-%T")
BACKUP_DIR="/backups/mongo_backup_${TIMESTAMP}"

# Create the backup directory
mkdir -p ${BACKUP_DIR}

# Dump MongoDB Database
mongodump --host mongo --port 27017 --username root --password passVerify --db inventory --out ${BACKUP_DIR}

# Upload the backup to S3
aws s3 cp ${BACKUP_DIR} s3://inventoryservice5636/ --recursive

# Clean up backups older than 30 days
find /backups -type f -mtime +30 -exec rm {} \;
