FROM ubuntu:18.04 AS build

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install autoconf automake curl flex g++ gcc gdb git \
  	krb5-admin-server krb5-kdc krb5-user libkrb5-dev libsasl2-dev libsasl2-modules \
  	libsasl2-modules-gssapi-mit libssl-dev libtool lsb-release make ntp \
  	openjdk-11-jdk openssl patch pkg-config python rsync unzip vim-common -y

RUN git clone https://github.com/apache/kudu

RUN kudu/thirdparty/build-if-necessary.sh

RUN mkdir -p kudu/build/release && cd kudu/build/release && \
	../../thirdparty/installed/common/bin/cmake -DNO_TESTS=1 -DCMAKE_BUILD_TYPE=release ../.. && \
	make -j1

RUN cd kudu/build/release && make DESTDIR=/opt/kudu install
RUN mv kudu/www /opt/kudu/kudu_webroot

FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install openjdk-11-jdk openssl python ntp \
	krb5-admin-server krb5-kdc krb5-user libkrb5-dev libsasl2-dev libsasl2-modules \
  	libsasl2-modules-gssapi-mit libssl-dev -y
COPY --from=build /opt/kudu /opt/kudu

WORKDIR /opt/kudu