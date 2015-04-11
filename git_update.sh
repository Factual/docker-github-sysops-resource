#!/bin/bash
/usr/sbin/nginx &

REFRESH=${REFRESH:-300}

echo "$GITHUB_SSH_KEY" > ~/.ssh/github_key && chmod 600 ~/.ssh/github_key

cd /var/www/ && git clone $GITHUB_REPO .

while true
do
  git pull
  sleep $REFRESH
done
