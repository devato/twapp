#!/bin/bash

export PATH="/home/client/node_modules/.bin:$PATH"

echo "Node Version:  $(node -v)"
echo "Node ENV:      $NODE_ENV"
echo "Npm Version:   $(npm -v)"

# Install modules
echo "Installing missing dependencies..."
yarn install

echo "Building libraries..."
yarn build

exec "$@"
