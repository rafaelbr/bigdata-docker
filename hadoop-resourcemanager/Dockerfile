FROM hadoop-base

ADD resourcemanager-run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088 8030 8031 8032 8033

CMD ["/run.sh"]