#!/usr/bin/expect -f
spawn ssh user@domain.com -t "cd /path/to/source && git pull origin master ; bash --login"
expect "password:"
send "insert password\r"
interact
