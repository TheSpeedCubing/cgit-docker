#!/bin/sh
spawn-fcgi -s /run/fcgiwrap.socket -M 766 /usr/sbin/fcgiwrap
nginx -t
nginx -g 'daemon off;'
