#!/bin/sh

#docker build -t kudu-base kudu-base/
#docker build -t kudu-master kudu-master/
#docker build -t kudu-tserver kudu-tserver/
#docker build -t cluster-base cluster-base/
#docker build -t hadoop-base hadoop-base/ 
docker build -t spark-base spark-base/
docker build -t spark-master spark-master/
docker build -t spark-worker spark-worker/
docker build -t hadoop-namenode  hadoop-namenode/
docker build -t hadoop-datanode  hadoop-datanode/
docker build -t hadoop-resourcemanager  hadoop-resourcemanager/
docker build -t hadoop-nodemanager  hadoop-nodemanager/
docker build -t hive  hive/
docker build -t kafka-base kafka-base/
docker build -t zookeeper  zookeeper/
docker build -t kafka-server kafka-server/