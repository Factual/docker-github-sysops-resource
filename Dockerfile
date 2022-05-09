FROM debian:bullseye

RUN DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install -y \
  nginx \
  git-core

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

ADD ssh_config /root/.ssh/config
ADD nginx-default-site /etc/nginx/sites-available/default

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD /root/start.sh 
