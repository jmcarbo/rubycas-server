#!/bin/sh
cd /rubycas-server
sed -i 's/REPLACE_THIS_PASSWORD/'"$LDAP_PASSWORD"'/' /etc/rubycas-server.yml
cat /etc/rubycas-server.yml
exec bundle exec rubycas-server -c /etc/rubycas-server.yml

