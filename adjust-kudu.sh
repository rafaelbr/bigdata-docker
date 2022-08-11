#!/bin/sh

docker exec kudu bash -c "echo '--use-hybrid-clock=false' >> /etc/kudu/conf/master.gflagfile"
docker exec kudu bash -c "echo '--use-hybrid-clock=false' >> /etc/kudu/conf/tserver.gflagfile"
docker exec kudu-tserver bash -c "echo '--use-hybrid-clock=false' >> /etc/kudu/conf/tserver.gflagfile"
docker exec kudu-tserver-2 bash -c "echo '--use-hybrid-clock=false' >> /etc/kudu/conf/tserver.gflagfile"
docker exec impala bash -c "yum --disablerepo=cloudera-cdh5,cloudera-impala-kudu install -y python-devel cyrus-sasl*"