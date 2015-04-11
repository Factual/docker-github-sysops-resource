FROM boritzio/docker-base

RUN DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install -y \
	nginx \
	git-core \
	openssl

RUN mkdir -p /var/www/

RUN chown -R www-data:www-data /var/www
RUN rm -rf /usr/share/nginx
ADD ssh_config /root/.ssh/config

ADD nginx-default-site /etc/nginx/sites-available/default

RUN ln -s /usr/sbin/nginx /etc/my_init.d/01_nginx

ADD git_update.sh /etc/my_init.d/02_git_update


