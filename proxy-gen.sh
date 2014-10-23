#!/bin/sh

if [ -z "$NGINX_CONTAINER" ]; then
  echo >&2 "Set NGINX_CONTAINER to specify the container name to HUP"
  exit 1
fi

if ! mountpoint -q /etc/nginx/conf.d; then
  echo >&2 "Missing volume at /etc/nginx/conf.d"
  exit 1
fi

cp /app/conf.d/*.conf /etc/nginx/conf.d/

exec docker-gen -notify-sighup "$NGINX_CONTAINER" -watch -only-exposed /app/nginx.tmpl /etc/nginx/conf.d/default.conf
