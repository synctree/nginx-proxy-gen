FROM jwilder/nginx-proxy
MAINTAINER Synctree App Force <docker@synctree.com>

ADD docker-cmd.sh /cmd.sh

CMD ["/cmd.sh"]
