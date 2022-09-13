FROM impala-base

COPY core-site.xml /opt/config/core-site.xml
COPY hdfs-site.xml /opt/config/hdfs-site.xml
COPY hive-site.xml /opt/config/hive-site.xml
COPY yarn-site.xml /opt/config/yarn-site.xml
COPY hbase-site.xml /opt/config/hbase-site.xml
COPY wait-for-it.sh /wait-for-it.sh

RUN DEBIAN_FRONTEND=noninteractive apt-get install tzdata -y
RUN mkdir -p /var/lib/hadoop-hdfs/dn

RUN chmod a+x /wait-for-it.sh

RUN touch file.wait

EXPOSE 21000 21001 21002 21003 21004 21050 21051 21052 21053 21054 25000 25001 25002 25003 25004 25010 25011 25012 25013 25020 25021 25022 25023 25024 28000 28001 28002 28003 28004

CMD /wait-for-it.sh hive:9083 && \
	/wait-for-it.sh hadoop:8020 && \
	bash -c "source bin/impala-config.sh && \
	cp -f /opt/config/core-site.xml fe/src/test/resources/core-site.xml && \
	cp -f /opt/config/hdfs-site.xml fe/src/test/resources/hdfs-site.xml && \
	cp -f /opt/config/hive-site.xml fe/src/test/resources/hive-site.xml && \
	cp -f /opt/config/hbase-site.xml fe/src/test/resources/hbase-site.xml && \
	cp -f /opt/config/yarn-site.xml fe/src/test/resources/yarn-site.xml && \
	bin/start-impala-cluster.py && \
	tail -f file.wait"