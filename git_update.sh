#!/bin/bash

REFRESH=${REFRESH:-300}
DOMAIN=${DOMAIN:-localhost}

echo "$GITHUB_SSH_KEY" > ~/.ssh/github_key && chmod 600 ~/.ssh/github_key

cd /var/www/ && git clone $GITHUB_REPO .

mkdir -p /etc/ssl/nginx

echo "$SSL_CERT" > /etc/ssl/nginx/server.crt
echo "$SSL_KEY" > /etc/ssl/nginx/server.key
echo "$SSL_CLIENT" > /etc/ssl/nginx/client.pem

sed -i 's/server_name.*/server_name $DOMAIN/' /etc/nginx/sites-available/default

while true
do
  git pull
  sleep $REFRESH
done
