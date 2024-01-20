#!/bin/bash

# (Re)build the container image
podman build --tag hugo-zoneton:latest -f Containerfile .

# TODO: re-deploy the service timer if necessary

# Build the static site using the image
podman run hugo-zoneton -v /opt/hugo-zoneton:z,rw
