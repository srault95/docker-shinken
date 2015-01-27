TODO
====

# webui.cfg
Utiliser remote_user_variable X_Remote_User si auth par nginx

# Préparer des images séparer pour les brokers, ... selon possibilités

Port ouvert::

    netstat -taupen | grep LISTEN

    tcp        0      0 0.0.0.0:9001            0.0.0.0:*               LISTEN      0          24953698    -
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      0          24954910    -
    
    # schedulerd
    tcp        0      0 0.0.0.0:7768            0.0.0.0:*               LISTEN      1000       24952560    -
    
    # reactionnerd
    tcp        0      0 0.0.0.0:7769            0.0.0.0:*               LISTEN      1000       24952550    -
    
    # pollerd
    tcp        0      0 0.0.0.0:7771            0.0.0.0:*               LISTEN      1000       24952547    -
    
    # broker
    tcp        0      0 0.0.0.0:7772            0.0.0.0:*               LISTEN      1000       24952559    -
    
    # receiverd
    tcp        0      0 0.0.0.0:7773            0.0.0.0:*               LISTEN      1000       24952558    -
    
    tcp        0      0 127.0.0.1:60197         0.0.0.0:*               LISTEN      1000       24952562    -
    tcp        0      0 127.0.0.1:40520         0.0.0.0:*               LISTEN      1000       24954930    -
    tcp        0      0 127.0.0.1:39913         0.0.0.0:*               LISTEN      1000       24952548    -
    tcp        0      0 127.0.0.1:51919         0.0.0.0:*               LISTEN      1000       24954921    -
    tcp        0      0 127.0.0.1:43665         0.0.0.0:*               LISTEN      1000       24953735    -
    tcp        0      0 127.0.0.1:51996         0.0.0.0:*               LISTEN      1000       24952556    -
    tcp6       0      0 ::1:7770                :::*                    LISTEN      1000       24952569    -
