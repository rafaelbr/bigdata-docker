FROM kudu-base

RUN mkdir -p /etc/kudu
COPY master.gflagfile /etc/kudu

EXPOSE 7051 8051
CMD service ntp start && /opt/kudu/usr/local/sbin/kudu-master --flagfile=/etc/kudu/master.gflagfile