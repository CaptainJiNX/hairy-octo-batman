FROM dockerfile/elasticsearch

RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest
