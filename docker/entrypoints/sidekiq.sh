#!/bin/bash
# Interpreter identifier

# Exit on fail
set -e

bundle check || bundle install --binstubs="$BUNDLE_BIN"

# Finally call command issued to the docker service
exec "$@"
