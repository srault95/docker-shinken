FROM srault95/docker-circus-base

MAINTAINER <stephane.rault@radicalspam.org>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update -y && \
  apt-get install -y --no-install-recommends software-properties-common && \
  add-apt-repository -y ppa:nginx/stable

RUN apt-get update &&  apt-get install --no-install-recommends -y \
    nginx \
    python-pycurl \
    python-cherrypy3 \
    nagios-plugins \
    libsys-statistics-linux-perl

RUN adduser shinken

RUN pip install shinken

RUN mkdir -p /etc/shinken/brokers \
  /etc/shinken/pollers \
  /etc/shinken/schedulers \
  /etc/shinken/modules \
  /etc/shinken/custom_configs
  
# Install shinken modules from shinken.io
RUN su - shinken -c 'shinken --init' && \
    su - shinken -c 'shinken install webui' && \
    su - shinken -c 'shinken install auth-htpasswd' && \
    su - shinken -c 'shinken install sqlitedb' && \
    su - shinken -c 'shinken install pickle-retention-file-scheduler' && \
    su - shinken -c 'shinken install booster-nrpe'

ADD config/conf/shinken/shinken.cfg /etc/shinken/shinken.cfg
ADD config/conf/shinken/broker-master.cfg /etc/shinken/brokers/broker-master.cfg
ADD config/conf/shinken/poller-master.cfg /etc/shinken/pollers/poller-master.cfg
ADD config/conf/shinken/scheduler-master.cfg /etc/shinken/schedulers/scheduler-master.cfg
ADD config/conf/shinken/webui.cfg /etc/shinken/modules/webui.cfg

#RUN         mkdir -p /etc/shinken/custom_configs /usr/local/custom_plugins && \
#                ln -sf /etc/shinken/custom_configs/htpasswd.users /etc/shinken/htpasswd.users


RUN rm -f /etc/nginx/sites-enabled/* /etc/nginx/sites-available/*
ADD config/conf/nginx.conf /etc/nginx/
ADD config/circus.d/* /etc/circus.d/
ADD config/setup.d/shinken /etc/setup.d/20-shinken
ADD config/setup.d/nginx /etc/setup.d/30-nginx
RUN chmod +x /etc/setup.d/*


EXPOSE  80


