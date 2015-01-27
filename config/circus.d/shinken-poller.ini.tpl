[watcher:shinken-poller]
cmd=/usr/bin/shinken-poller -c /etc/shinken/daemons/pollerd.ini
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
