[watcher:shinken-broker]
command=/usr/bin/shinken-broker -c /etc/shinken/daemons/brokerd.ini
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
