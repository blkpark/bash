#!/usr/bin/expect -f
spawn ssh user@domain -t "cd /var/www/html; bash --login"
expect "password:"
send "insert password\r"
interact
