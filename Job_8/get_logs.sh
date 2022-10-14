#!/bin/bash
jour=$(date +%d-%m-%Y-%H:%M)
file=number_connection-$jour
sudo grep -w "opened for user augustin" -c /var/log/auth.log >> ./$file
tar -cvf ./$file.tar.gz $file
mv $file.tar.gz ./Backup
rm $file
