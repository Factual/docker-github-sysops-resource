#!/bin/bash

nginx -g "daemon off;"&

REFRESH=${REFRESH:-300}

echo "$GITHUB_SSH_KEY" > ~/.ssh/github_key && chmod 600 ~/.ssh/github_key

cd /var/www/html && rm -rf * && git clone $GITHUB_REPO .

while true
do
  git pull
  echo "i pulled"
  sleep $REFRESH
done
