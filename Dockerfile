# Container
FROM ubuntu:16.04

# Author
MAINTAINER SUMIN "dev@sumin.me"

# Update system
RUN apt-get update
RUN apt-get -y install wget and curl

# Install apache2
RUN apt-get -y install apache2
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn

# Install php
RUN apt-get -y install php libapache2-mod-php php-cli php-gd php-mysql php-curl php7.0-zip php7.0-dom php7.0-mbstring 

# 
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# 
EXPOSE 80

# 
CMD ["/run.sh"]
