FROM kudu-base

RUN mkdir -p /etc/kudu
COPY tserver.gflagfile /etc/kudu

EXPOSE 7050 8050
CMD service ntp start && /opt/kudu/usr/local/sbin/kudu-tserver --flagfile=/etc/kudu/tserver.gflagfile