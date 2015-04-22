#!/bin/bash

DOMAIN=${DOMAIN:-localhost}
PORT=${PORT:-80}
mkdir -p /etc/ssl/nginx

if [[ "$PORT" == 443 ]]; then

	if [[ ! -z $SSL_CERT ]] &&  [[ ! -z $SSL_KEY ]] && [[ ! -z $SSL_CLIENT ]]; then

		echo "$SSL_CERT" > /etc/ssl/nginx/server.crt
		echo "$SSL_KEY" > /etc/ssl/nginx/server.key
		echo "$SSL_CLIENT" > /etc/ssl/nginx/client.pem
		sed -i "s/listen 80/listen $PORT/" /etc/nginx/sites-available/default
	else
		echo "One or more SSL environment variables are missing : SSL_CERT, SSL_KEY, SSL_CLIENT"
	fi
fi

sed -i "s/server_name.*/server_name $DOMAIN/" /etc/nginx/sites-available/default
