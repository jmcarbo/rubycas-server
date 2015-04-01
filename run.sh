#!/bin/bash
cd /rubycas-server

sed -i 's/PLACEHOLDER_LDAP_PASSWORD/'"$LDAP_PASSWORD"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_BASEDN/'"$LDAP_BASEDN"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_HOST/'"$LDAP_PORT_389_TCP_ADDR"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_PORT/'"$LDAP_PORT_389_TCP_PORT"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_BINDDN/'"$LDAP_BINDDN"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_FILTER/'"$LDAP_FILTER"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_LDAP_UID/'"$LDAP_UID"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_CAS_EXTRA_ATTRIBUTES/'"$CAS_EXTRA_ATTRIBUTES"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_HOST/'"$MYSQL_PORT_3306_TCP_ADDR"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_PASSWORD/'"$MYSQL_PASSWORD"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_USERNAME/'"$MYSQL_USERNAME"'/' /etc/rubycas-server.yml
sed -i 's/PLACEHOLDER_MYSQL_DATABASE/'"$MYSQL_DATABASE"'/' /etc/rubycas-server.yml

exec bundle exec rubycas-server -c /etc/rubycas-server.yml
