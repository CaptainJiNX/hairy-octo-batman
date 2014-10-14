# JiNX nodejs customized image

FROM dockerfile/nodejs
RUN npm install forever -g

# Cache npm packages
ADD source/package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

# App code
ADD source/. /opt/app/

EXPOSE 8080

CMD forever /opt/app/index.js
