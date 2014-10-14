# JiNX nodejs customized image
FROM dockerfile/nodejs
RUN npm install forever -g

VOLUME ["/opt/app"]

CMD forever /opt/app/index.js

EXPOSE 8080
