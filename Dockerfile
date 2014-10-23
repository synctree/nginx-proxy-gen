FROM jwilder/nginx-proxy
MAINTAINER Synctree App Force <docker@synctree.com>

ADD docker-entrypoint.sh /entrypoint.sh

# Ensures that /etc/nginx/conf.d is a volume and that NGINX_CONTAINER is set
ENTRYPOINT ["/entrypoint.sh"]

CMD ["docker-gen", "-notify-sighup", "$NGINX_CONTAINER", "-watch", "-only-exposed", "/app/nginx.tmpl", "/etc/nginx/conf.d/default.conf"]
