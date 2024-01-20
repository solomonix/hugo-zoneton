#!/bin/bash

# (Re)build the container image
podman build --tag hugo-zoneton:latest -f Containerfile .

# TODO: re-deploy the service timer if necessary

# Build the static site using the image
podman run -v /opt/hugo-zoneton:/src:z,rw --rm hugo-zoneton /bin/bash -c 'cd /src && hugo -b "https://zonetonlodge.org/" --minify'

# Copy the resulting public directory to /var/www
rm -rf /var/www/hugo-zoneton/*
cp -R /opt/hugo-zoneton/public/* /var/www/hugo-zoneton/

