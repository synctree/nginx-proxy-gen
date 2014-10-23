#!/bin/sh

if [ -z "$NGINX_CONTAINER" ]; then
  echo >&2 "Set NGINX_CONTAINER to specify the container name to HUP"
  exit 1
fi

if ! mountpoint -q /etc/nginx/conf.d; then
  echo >&2 "Missing volume at /etc/nginx/conf.d"
  exit 1
fi

exec "$@"
