[watcher:shinken-reactionner]
command=/usr/bin/shinken-reactionner -c /etc/shinken/daemons/reactionnerd.ini
uid=shinken
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
