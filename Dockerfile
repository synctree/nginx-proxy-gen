FROM jwilder/docker-gen:0.3.4
MAINTAINER Synctree App Force <docker@synctree.com>

RUN mkdir /app
WORKDIR /app
ADD proxy-gen.sh /app/
ADD nginx-proxy/nginx.tmpl /app/
ADD conf.d /app/conf.d

# XXX: Work around https://github.com/docker/docker/issues/8732
ENTRYPOINT ["bash", "-c"]
#ENTRYPOINT []

CMD ["/app/proxy-gen.sh"]
