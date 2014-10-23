FROM jwilder/docker-gen:0.3.4
MAINTAINER Synctree App Force <docker@synctree.com>

RUN mkdir /app
WORKDIR /app
ADD proxy-gen.sh /app/
ADD nginx-proxy/nginx.tmpl /app/

ENTRYPOINT []
CMD ["/app/proxy-gen.sh"]
