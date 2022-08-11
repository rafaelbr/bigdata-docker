FROM hadoop-base

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD datanode-run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864 50010

CMD ["/run.sh"]
