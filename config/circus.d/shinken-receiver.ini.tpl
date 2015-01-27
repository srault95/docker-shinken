[watcher:shinken-receiver]
command=/usr/bin/shinken-receiver -c /etc/shinken/daemons/receiverd.ini
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
