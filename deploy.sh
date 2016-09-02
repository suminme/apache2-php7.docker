#!/bin/bash

chmod 755 /permission.sh && ./permission.sh

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
