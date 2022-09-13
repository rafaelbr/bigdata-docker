FROM hadoop-base

ARG hive_version=3.1.3000.7.2.16.0-164

RUN curl -L https://native-toolchain.s3.amazonaws.com/build/cdp_components/31397203/tarballs/apache-hive-${hive_version}-bin.tar.gz -o hive.tar.gz && \
	curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.tar.gz -o mysql-connector-java.tar.gz && \
	tar xvf hive.tar.gz && \
	tar xvf mysql-connector-java.tar.gz && \
	mkdir /warehouse && \
	mv apache-hive-${hive_version}-bin /opt && \
	mv mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /opt/apache-hive-${hive_version}-bin/lib

COPY hive-site.xml /opt/apache-hive-${hive_version}-bin/conf/
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod a+x /wait-for-it.sh
COPY hive-startup.sh /hive-startup.sh

RUN chmod a+x /hive-startup.sh

ENV HIVE_HOME=/opt/apache-hive-${hive_version}-bin

WORKDIR $HIVE_HOME


EXPOSE 9083

CMD /wait-for-it.sh mysql:3306 -- /hive-startup.sh