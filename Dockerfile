FROM dockerfile/elasticsearch

VOLUME ["/data"]

ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ADD config/realm.properties /elasticsearch/config/realm.properties

RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest
RUN \
	/elasticsearch/bin/plugin -url https://oss-es-plugins.s3.amazonaws.com/elasticsearch-jetty/elasticsearch-jetty-1.2.1.zip -install elasticsearch-jetty-1.2.1 && \
	cp /elasticsearch/config/jetty-1.2.1/jetty.xml /elasticsearch/config/ && \
	cp /elasticsearch/config/jetty-1.2.1/jetty-hash-auth.xml /elasticsearch/config/ && \
	cp /elasticsearch/config/jetty-1.2.1/jetty-restrict-writes.xml /elasticsearch/config/

WORKDIR /data

CMD ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200
EXPOSE 9300
