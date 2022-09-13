FROM ubuntu:18.04

ARG shared_workspace=/opt/workspace

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk curl && \
    rm -rf /var/lib/apt/lists/* 

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64

ENV SHARED_WORKSPACE=${shared_workspace}

VOLUME ${shared_workspace}
CMD ["bash"]

