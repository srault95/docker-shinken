[watcher:shinken-arbiter]
command=/usr/bin/shinken-arbiter -c /etc/shinken/shinken.cfg
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
