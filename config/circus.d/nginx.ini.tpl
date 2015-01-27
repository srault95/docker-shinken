[watcher:nginx]
cmd = nginx
#args = 
numprocesses = 1
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
