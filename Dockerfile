FROM srault95/supervisor-base

MAINTAINER <stephane.rault@radicalspam.org>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update -y && \
  add-apt-repository -y ppa:nginx/development

RUN apt-get update &&  apt-get install --no-install-recommends -y \
    nginx \
    python-pycurl \
    python-cherrypy3 \
    nagios-plugins \
    nagios-plugins-extra \
    libsys-statistics-linux-perl
    
RUN adduser shinken

#RUN curl -O https://www.monitoring-plugins.org/download/monitoring-plugins-2.1.1.tar.gz
#RUN tar -xzf monitoring-plugins-2.1.1.tar.gz && cd monitoring-plugins-2.1.1 && ./configure && make && make install

RUN pip install shinken

RUN mkdir -p /etc/shinken/brokers \
  /etc/shinken/pollers \
  /etc/shinken/schedulers \
  /etc/shinken/modules \
  /etc/shinken/custom_configs
  
# Install shinken modules from shinken.io

#https://github.com/shinken-monitoring/mod-auth-htpasswd
#auth-htpasswd      : authentification from Apache passwd files

#https://github.com/shinken-monitoring/mod-webui
#choisir backend http_backend gevent

RUN su - shinken -c 'shinken --init' && \
    su - shinken -c 'shinken install webui' && \
    su - shinken -c 'shinken install auth-htpasswd' && \
    su - shinken -c 'shinken install sqlitedb' && \
    su - shinken -c 'shinken install pickle-retention-file-scheduler' && \
    su - shinken -c 'shinken install booster-nrpe'

#ADD config/conf/shinken/shinken.cfg /etc/shinken/shinken.cfg
#ADD config/conf/shinken/broker-master.cfg /etc/shinken/brokers/broker-master.cfg
#ADD config/conf/shinken/poller-master.cfg /etc/shinken/pollers/poller-master.cfg
#ADD config/conf/shinken/scheduler-master.cfg /etc/shinken/schedulers/scheduler-master.cfg
#ADD config/conf/shinken/webui.cfg /etc/shinken/modules/webui.cfg

#RUN mkdir -p /etc/shinken/custom_configs /usr/local/custom_plugins && \
#    ln -sf /etc/shinken/custom_configs/htpasswd.users /etc/shinken/htpasswd.users

#ADD config/conf/extra_plugins/* /usr/lib/nagios/plugins/

#RUN cd /usr/lib/nagios/plugins/ && chmod a+x * && \
#    chmod u+s check_apt restart_service check_ping check_icmp apt_update check_fping

RUN rm -f /etc/nginx/sites-enabled/* /etc/nginx/sites-available/*
ADD config/conf/nginx.conf /etc/nginx/

ADD config/supervisor/conf.d/* /etc/supervisor/conf.d/
ADD config/setup.d/shinken /etc/setup.d/20-shinken
ADD config/setup.d/nginx /etc/setup.d/30-nginx
RUN chmod +x /etc/setup.d/*

#VOLUME ["/etc/shinken/custom_configs", "/usr/local/custom_plugins"]

EXPOSE  80
