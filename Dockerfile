FROM node:alpine

ENV SCRUMBLR_PORT="8080"
ENV SCRUMBLR_REDIS_URL="redis://redis"
ENV SCRUMBLR_REDIS_PORT="6379"

RUN cd /tmp \
    && wget https://github.com/aliasaria/scrumblr/archive/master.zip \
    && unzip master.zip \
    && rm master.zip \
    && mv scrumblr-master /srv/scrumblr \
    && cd /srv/scrumblr \
    && ls \
    && npm install

WORKDIR /srv/scrumblr

ENTRYPOINT /usr/local/bin/node server.js \
           --server:port=${SCRUMBLR_PORT} \
           --redis:url=${SCRUMBLR_REDIS_URL}:${SCRUMBLR_REDIS_PORT}
