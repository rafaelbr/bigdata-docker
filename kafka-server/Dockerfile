FROM kafka-base

COPY server.properties /

RUN mv /server.properties config/

ARG kafka_port=9092

EXPOSE ${kafka_port}
CMD bin/kafka-server-start.sh config/server.properties