FROM dockerfile/elasticsearch

VOLUME ["/data"]

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest

WORKDIR /data

CMD ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200
EXPOSE 9300
