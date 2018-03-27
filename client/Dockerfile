FROM node:9.7.1

# app home
ENV APP_HOME=/home/client

# Install node_modules with yarn
ADD package.json yarn.lock /tmp/
RUN cd /tmp && yarn
RUN mkdir $APP_HOME && cd $APP_HOME && ln -s /tmp/node_modules

# Node base template
WORKDIR $APP_HOME

ADD . $APP_HOME


