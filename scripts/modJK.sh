#!/bin/bash
set -e
mkdir -p /opt/mod_jk/
cd /opt/mod_jk
wget http://apache.mirrors.spacedump.net/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz
tar -xzvf tomcat-connectors-1.2.42-src.tar.gz
cd tomcat-connectors-1.2.42-src/native

./configure --with-apxs=/usr/bin/apxs --enable-api-compatibility
make
libtool --finish /usr/lib64/httpd/modules
cp ./apache-2.0/mod_jk.so /usr/lib64/httpd/modules/
make install
mkdir -p /var/run/mod_jk
chown apache:apache /var/run/mod_jk
/etc/init.d/httpd restart
cd /etc/httpd/conf/workers.properties

#SOURCE=files/workers.properties
#DESTINATION=/etc/httpd/conf/workers.properties
#if[[-d $DESTINATION ]]; then
#sudo rsync -v\
#$SOURCE $DESTINATION

#touch /etc/httpd/conf.d/mod_jk.conf

#SOURCE="files/mod_jk.conf"
#DESTINATION=/etc/httpd/conf.d/mod_jk.conf
#if[[-d $DESTINATION ]]; then
#sudo rsync -v\
#$SOURCE $DESTINATION
#touch /etc/httpd/conf.d/ssl.conf
#SOURCE="files/ssl.conf"
#DESTINATION=/etc/httpd/conf.d/ssl.conf
#if[[-d $DESTINATION ]]; then
#sudo rsync -v\
#$SOURCE $DESTINATION
#/etc/init.d/httpd restart
