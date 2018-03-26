FROM bitnami/ruby:2.4.3-r1

# Dependencies
RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update -qq

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
  nodejs \
  libpq-dev \
  libsqlite3-dev

# Clean!
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set app home
ENV APP_HOME /home/api

# Bundle installs with binstubs to our custom /bundle/bin volume path.
# Let system use those stubs.
RUN bundle config --global silence_root_warning 1
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

# Make home directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add files
ADD Gemfile* $APP_HOME/
ADD docker $APP_HOME/docker/
RUN bash docker/bundle.sh

# Add Rails app
ADD . $APP_HOME
