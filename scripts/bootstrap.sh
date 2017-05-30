#!/bin/bash 
set -e
#
#
#
echo ">>> Starting bootstrap  Script"

# Disable selinux
cp /etc/selinux/config /etc/selinux/config.bak
sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config

# Update CentOS with any pathces
yum -y update --exclude=kernel

# Update the rpm 
rpm -Uvh http://repo.webtatic.com/yum/el6/latest.rpm

# Install Tools and Utilities
yum install -y git

# Install java
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

# Set enviroment
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64

# Install tomcat 
yum install -y tomcat

# Install Apache
yum install -y httpd httpd-devel httpd-tools

chkconfig --add httpd
chkconfig httpd on

service httpd stop
rm -rf /var/www/html
ln -s /vagrant /var/www/html
service httpd start 

cd /etc/tomcat/
sudo -u vagrant mv server.xml server.xml.bac
sudo -u vagrant wget -q https://raw.########################.SERVER.XML

cd /usr/share/tomcat/lib/
sudo -u vagrant wget -q https://github.com/Unicon/shibboleth-tomcat-dta-ssl/releases/download/v1.1/tomcat7-1.1.jar

cd usr/share/tomcat/conf/Catalina/localhost/
sudo -u vagrant wget -q https://raw.###################.IDP.XML

