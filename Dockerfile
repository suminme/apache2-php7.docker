# Container
FROM ubuntu:16.04

# Author
MAINTAINER SUMIN "dev@sumin.me"

# Update system
RUN apt-get update
RUN apt-get -y install wget and curl

# Install apache2
RUN apt-get -y install apache2

# Install php
RUN apt-get -y install php libapache2-mod-php php-cli php-gd php-mysql php-curl php7.0-zip php7.0-dom php7.0-mbstring

# Config
RUN a2enmod rewrite
RUN sed -i "s/AllowOverride None/AllowOverride ALL/g" /etc/apache2/apache2.conf

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn

# 
ADD deploy.sh /run.sh
ADD permission.sh /permission.sh

# 
CMD ["/deploy.sh"]
