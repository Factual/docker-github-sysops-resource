FROM boritzio/docker-base

RUN DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install -y \
	nginx \
	git-core \
	openssl

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /var/www/

RUN chown -R www-data:www-data /var/www
RUN rm -rf /usr/share/nginx
ADD ssh_config /root/.ssh/config

ADD nginx-default-site /etc/nginx/sites-available/default

ADD first_exec.sh /etc/my_init.d/01_first_exec

RUN mkdir -p /etc/service/nginx
ADD git_update.sh /etc/service/nginx/run


