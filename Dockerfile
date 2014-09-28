FROM debian:stable
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install git ruby rubygems
RUN git clone git://github.com/rubycas/rubycas-server.git /rubycas-server

RUN gem install bundler
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ruby-mkrf ruby-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libsqlite3-dev

ADD pps /rubycas-server/public/themes/pps
RUN cd /rubycas-server && bundle install

#RUN gem install yaml_command

ADD config.pps.yml  /etc/rubycas-server.yml

ADD run.sh /run.sh

EXPOSE 80
WORKDIR /rubycas-server

#CMD ["bundle", "exec", "rubycas-server", "-c", "/etc/rubycas-server.yml"]
CMD ["/run.sh"]
