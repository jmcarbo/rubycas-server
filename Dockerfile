FROM debian:stable
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install git ruby rubygems ruby-mkrf ruby-dev libsqlite3-dev
RUN git clone git://github.com/rubycas/rubycas-server.git /rubycas-server
RUN cd /rubycas-server && git checkout 23e3852f9f346b73a159b0fa44c849496798f6e2
RUN gem install bundler
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ruby-mysql libmysqlclient-dev
RUN gem install activerecord-mysql-adapter

ADD pps /rubycas-server/public/themes/pps
RUN echo 'gem "mysql2"' >> /rubycas-server/Gemfile
RUN cd /rubycas-server && bundle install

ADD config.pps.yml  /etc/rubycas-server.yml
ADD run.sh /run.sh

#ENV MYSQL_PORT_3306_TCP_ADDR mysql
ENV MYSQL_USERNAME casserver
ENV MYSQL_DATABASE casserver
ENV MYSQL_PASSWORD casserver

#ENV LDAP_PORT_389_TCP_ADDR ldap
#ENV LDAP_PORT_389_TCP_PORT 389
ENV LDAP_PASSWORD root
ENV LDAP_BASEDN dc=piratenpartei,dc=ch
ENV LDAP_BINDDN cn=mdbgui,dc=piratenpartei,dc=ch
ENV LDAP_FILTER (objectClass=ppsPerson)
ENV LDAP_UID uid

ENV CAS_EXTRA_ATTRIBUTES uid, cn, mail, sn, givenName

EXPOSE 80
WORKDIR /rubycas-server

CMD ["/run.sh"]
