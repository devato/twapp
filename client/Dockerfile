FROM node:9.7.1

# app home
ENV APP_HOME=/home/client

RUN mkdir $APP_HOME

# Node base template
WORKDIR $APP_HOME

COPY package.json yarn.lock ./
RUN yarn --pure-lockfile

ADD . $APP_HOME


