#!/bin/sh

docker exec impala bash -c "yum --disablerepo=cloudera-cdh5,cloudera-impala-kudu install -y python-devel cyrus-sasl*"