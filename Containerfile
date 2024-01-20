# start with the basic RHEL image:
FROM fedora:latest 
LABEL org.zonetonlodge.image.authors="harlen@harlencompton.com"

# install hugo
RUN dnf install --assumeyes hugo

# run the hugo build on /src
WORKDIR /src
RUN mv /src/public/.gitignore /tmp
RUN rm -rf /src/public/*
RUN mv /tmp/.gitignore /src/public/.gitignore
CMD exec hugo
