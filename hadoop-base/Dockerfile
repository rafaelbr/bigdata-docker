FROM cluster-base

ARG hadoop_version=2.10.2

RUN curl https://dlcdn.apache.org/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz -o hadoop.tar.gz && \
	tar xvf hadoop.tar.gz && \
	mv hadoop-2.10.2 /opt

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV HADOOP_HOME=/opt/hadoop-${hadoop_version}/
ENV HADOOP_CONF_DIR=/opt/hadoop-${hadoop_version}/etc/hadoop
ENV YARN_CONF_DIR=/opt/hadoop--${hadoop_version}/etc/hadoop
ENV CLUSTER_NAME=Docker

COPY core-site.xml $HADOOP_CONF_DIR/core-site.xml
COPY hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
COPY yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml


WORKDIR $HADOOP_HOME
