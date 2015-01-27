[watcher:shinken-scheduler]
command=/usr/bin/shinken-scheduler -c /etc/shinken/daemons/schedulerd.ini
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
