#!/bin/bash

#Define source directory
sourcedir="/home/"

#Get the time
time=`date "+%Y.%m.%d"`

#Create backupdir
backupdir="/backup/daily-$time"
mkdir $backupdir

#Start the backup
rsync -avHP $sourcedir $backupdir

#Compress the backup
tar -czvf "$backupdir.tar.gz" $backupdir

#Clean up uncompressed backup
rm -rf $backupdir

#Remove any backups older than 30 days
find "/backup/" -type f -mtime +30 -exec rm -rf {} \;
