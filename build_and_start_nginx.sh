#!/bin/bash

echo "Starting webpack build..."
npm run build:prod

echo "Copying built files to nginx directories..."
cp -r /src/build-your-own-radar/dist/*           /opt/build-your-own-radar/
cp    /src/build-your-own-radar/default.template /etc/nginx/conf.d/default.conf

echo "Starting nginx server..."
nginx
echo "Nginx server is UP!"

sleep infinity
