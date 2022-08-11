FROM cluster-base

ARG kafka_version=2.2.1
ARG scala_version=2.11

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl https://archive.apache.org/dist/kafka/${kafka_version}/kafka_${scala_version}-${kafka_version}.tgz -o kafka.tgz && \
    tar xvf kafka.tgz && \
    mv kafka_${scala_version}-${kafka_version} /usr/bin && \
    rm -rf kafka_${scala_version}-${kafka_version}.tgz

ENV KAFKA_HOME /usr/bin/kafka_${scala_version}-${kafka_version}
ENV ZOOKEEPER_HOST zookeeper
ENV ZOOKEEPER_PORT 2181

# -- Runtime

WORKDIR ${KAFKA_HOME}