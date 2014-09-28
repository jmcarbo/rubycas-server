#!/bin/bash
cd /rubycas-server

sed -i 's/PLACEHOLDER_LDAP_PASSWORD/'"$LDAP_PASSWORD"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_HOST/'"$MYSQL_PORT_5432_TCP_ADDR"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_PASSWORD/'"$MYSQL_PASSWORD"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_USERNAME/'"$MYSQL_USERNAME"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_DATABASE/'"$MYSQL_DATABASE"'/' /etc/rubycas-server.yml

exec bundle exec rubycas-server -c /etc/rubycas-server.yml
