#!/bin/bash
# Interpreter identifier

# Exit on fail
set -e

bundle check || bundle install --binstubs="$BUNDLE_BIN"
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

# Setup db and/or run migrations
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate db:seed

# Finally call command issued to the docker service
exec "$@"
