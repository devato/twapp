#!/bin/bash

# Exit on fail
set -e

# Wait for PostgreSQL
until curl $DB_HOST:5432 2>&1 | grep '52'; do
  echo 'Waiting for PostgreSQL...'
  sleep 1
done
echo "PostgreSQL is up and running"

# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.
bundle check || bundle install --binstubs="$BUNDLE_BIN"

# Setup db and/or run migrations
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate db:seed

# Finally call command issued to the docker service
exec "$@"
