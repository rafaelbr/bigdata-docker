FROM hadoop-base as build

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install build-essential git texinfo \
	bison autoconf automake libtool libz-dev libssl-dev libncurses-dev libsasl2-dev libkrb5-dev \
	wget lsb-release ccache xxd libffi-dev python python-setuptools python3-setuptools unzip groff-base \
	flex rsync pkg-config -y

RUN cd /opt && git clone --branch asf-impala-4.1 https://github.com/cloudera/native-toolchain.git

RUN cd /opt/native-toolchain && DEBUG=1 ./buildall.sh

ENV NATIVE_TOOLCHAIN_HOME=/opt/native-toolchain

RUN curl -L https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -o apache-maven.tar.gz && \
	tar xvf apache-maven.tar.gz && mv apache-maven-3.8.6 /opt/

ENV MAVEN_HOME=/opt/apache-maven-3.8.6

RUN cd /opt && mkdir impala && curl -L https://dlcdn.apache.org/impala/4.1.0/apache-impala-4.1.0.tar.gz -o impala.tar.gz && \
	tar xvf impala.tar.gz
RUN apt-get install python-dev python3-dev -y

ENV IMPALA_HOME=/opt/apache-impala-4.1.0

RUN (cd ${IMPALA_HOME} && mkdir -p toolchain && cd toolchain && ln -s ${NATIVE_TOOLCHAIN_HOME}/build/* .)

RUN export PATH=${PATH}:/opt/apache-maven-3.8.6/bin && cd ${IMPALA_HOME} && echo "export SKIP_TOOLCHAIN_BOOTSTRAP=true" >> bin/impala-config-local.sh && \
	bash bin/impala-config.sh && export IMPALA_TOOLCHAIN=${IMPALA_HOME}/toolchain && \
	./buildall.sh -notests -noclean -release

#RUN rsync -av --progress /opt/impala /opt/apache-impala --exclude /opt/impala/toolchain


WORKDIR $IMPALA_HOME
	