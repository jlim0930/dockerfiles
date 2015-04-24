#!/bin/bash

echo "=> Starting squid"
/usr/sbin/squid -N -z -F -f /etc/squid/squid.conf /var/log/squid/squid.out
/usr/sbin/squid -N ${SQUID_OPTS}
