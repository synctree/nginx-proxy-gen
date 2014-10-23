# nginx-proxy-gen

The `nginx-proxy-gen` image uses `docker-gen` to generate reverse proxy configs
for nginx based on the Docker event stream. It assumes a separate container
running nginx and a shared `/etc/nginx/conf.d` directory between the two
containers.

## Setup

To run an Nginx reverse proxy, you'll need three containers.

First, create a volume container for `/etc/nginx/conf.d` to be shared between
the `nginx-proxy-gen` container and the Nginx container.

    $ docker run -v /etc/nginx/conf.d --name proxy-conf tianon/true

Next, create an Nginx proxy using the volumes from the first container to allow
conf changes to be shared between the proxy container and the `nginx-proxy-gen`
container:

    $ docker run -d --volumes-from proxy-conf -p 80:80 --name proxy nginx

Last, create an `nginx-proxy-gen` container, passing the container ID or name
of the proxy, the volumes from the first container, and the host docker.sock:

    $ docker run -d -e NGINX_CONTAINER=proxy --volumes-from proxy-conf \
        -v /var/run/docker.sock:/tmp/docker.sock --name proxy-gen \
        synctree/nginx-proxy-gen

## Usage

See the documentation for [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)
for more information about setting up backend containers to work with this one.
