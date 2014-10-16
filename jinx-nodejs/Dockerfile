# JiNX nodejs customized image
FROM dockerfile/nodejs
RUN npm install forever -g

VOLUME ["/usr/local/src"]

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

CMD ["bash"]

EXPOSE 8080
