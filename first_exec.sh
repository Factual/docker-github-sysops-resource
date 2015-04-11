#!/bin/bash
DOMAIN=${DOMAIN:-localhost}
mkdir -p /etc/ssl/nginx

echo "$SSL_CERT" > /etc/ssl/nginx/server.crt
echo "$SSL_KEY" > /etc/ssl/nginx/server.key
echo "$SSL_CLIENT" > /etc/ssl/nginx/client.pem

sed -i "s/server_name.*/server_name $DOMAIN/" /etc/nginx/sites-available/default
