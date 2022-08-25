# bigdata-docker
Spark/Hadoop cluster with some services

Here we create a Big Data cluster with the following services:
* Hadoop
* Spark
* Hive
* MySQL (for Hive Metastore)
* Kudu
* Impala (only for Kudu)
* Kafka

For now, we don't have build in docker-compose, so you need to run build-images.sh script in order to build all images.

Because a problem on Impala image I'm using, you need to run adjust-impala.sh when compose is starting. After that restart compose.

## TODOs
* Include build step into docker-compose.yml
* Make impala image and configure on Impala, Hive and Kudu with correct packages
