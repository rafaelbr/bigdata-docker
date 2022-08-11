#!/bin/sh

docker build -t cluster-base --platform amd64 cluster-base/ 
docker build -t spark-base --platform amd64 spark-base/
docker build -t spark-master --platform amd64 spark-master/
docker build -t spark-worker --platform amd64 spark-worker/
docker build -t hadoop-base --platform amd64 hadoop-base/
docker build -t hadoop-namenode --platform amd64 hadoop-namenode/
docker build -t hadoop-datanode --platform amd64 hadoop-datanode/
docker build -t hadoop-resourcemanager --platform amd64 hadoop-resourcemanager/
docker build -t hadoop-nodemanager --platform amd64 hadoop-nodemanager/
docker build -t hive --platform amd64 hive/
docker build -t kafka-base --platform amd64 kafka-base/
docker build -t zookeeper --platform amd64 zookeeper/
docker build -t kafka-server --platform amd64 kafka-server/