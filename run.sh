#!/bin/bash

./permission.sh

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
