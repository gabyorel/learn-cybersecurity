# use python to spawn a better featured bash shell
python3 -c 'import pty;pty.spawn("/bin/bash")'
python3 -c "__import__('pty').spawn('/bin/bash')"
python3 -c "__import__('subprocess').call(['/bin/bash'])"

# give access to basic term commands
export TERM=xterm

# give access to tab autocompletes, arrow keys and Ctrl+C to kill processes
stty raw -echo; fg