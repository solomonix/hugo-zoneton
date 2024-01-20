# start with the basic RHEL image:
FROM fedora:latest 
LABEL org.zonetonlodge.image.authors="harlen@harlencompton.com"

# install hugo
RUN dnf install --assumeyes hugo

