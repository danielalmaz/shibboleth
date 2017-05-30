#!/bin/bash 
set -e
#
#
#
echo ">>> Starting bootstrap  Script"

# Update CentOS with any pathces
yum -y update --exclude=kernel

# Update the rpm 
rpm -Uvh http://repo.webtatic.com/yum/el6/latest.rpm

# Install Tools
yum install -y git

# Install Apache
yum install -y httpd httpd-devel httpd-tools

chkconfig --add httpd
chkconfig httpd on

service httpd stop
rm -rf /var/www/html
ln -s /vagrant /var/www/html
service httpd start 

