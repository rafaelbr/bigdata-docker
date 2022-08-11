FROM hadoop-base

ARG hive_version=2.3.6

RUN curl http://archive.apache.org/dist/hive/hive-${hive_version}/apache-hive-${hive_version}-bin.tar.gz hive.tar.gz && \
	curl https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.tar.gz mysql-connector-java.tar.gz && \
	tar xvf hive.tar.gz && \
	tar xvf mysql-connector-java.tar.gz && \
	mkdir /warehouse && \
	mv apache-hive-${hive_version}-bin /opt && \
	mv mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /opt/apache-hive-${hive_version}-bin/lib

COPY hive-site.xml /opt/apache-hive-${hive_version}-bin/conf/

COPY hive-startup.sh /hive-startup.sh

RUN chmod a+x /hive-startup.sh

ENV HIVE_HOME=/opt/apache-hive-${hive_version}-bin

WORKDIR $HIVE_HOME


EXPOSE 9083

CMD /hive-startup.sh