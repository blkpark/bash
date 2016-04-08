#!/bin/bash
DiskStatus=$(df -h | grep / | awk '{OFS ="\t"} {print "Path: "$1, "Used: "$3"bytes", "Available: "$4"bytes"}' | sed 's/Bibytes/bytes/g')
Emails=$(<emails.txt)

mail -s 'Disk Status Alert' $Emails << EOF
$HOSTNAME

$DiskStatus
EOF