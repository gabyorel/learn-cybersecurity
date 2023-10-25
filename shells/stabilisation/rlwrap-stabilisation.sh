# prepending our netcat listener with "rlwrap" gives us a much more fully featured shell
rlwrap nc -lvnp 443

# it's possible to completely stabilise when dealing with a linux target
stty raw -echo; fg