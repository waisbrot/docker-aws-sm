FROM debian:12-slim

RUN apt-get update -qq && apt-get install -qq -y curl unzip
RUN curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
 && unzip -q /tmp/awscliv2.zip -d /tmp \
 && /tmp/aws/install \
 && rm -rf /tmp/*
RUN curl -s "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb" \
 && dpkg -i /tmp/session-manager-plugin.deb \
 && rm -rf /tmp/*
ENTRYPOINT [ "/usr/local/bin/aws" ]
