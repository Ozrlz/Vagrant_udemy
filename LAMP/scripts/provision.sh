#! /bin/bash

# IMPORTANT: All these commands are run as root, use sudo -u $user to change to another user

# Update the system
yum update -y

# Install utilities
yum install -y nano git unzip screen wget

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update

# Install apache
yum install -y httpd httpd-devel httpd-tools
# Apache configs
systemctl enable httpd.service
service httpd stop > /dev/null 2>&1
# Delete html folder 
rm -rf /var/www/html/
cp -r /home/content/ /var/www/html
chown -R apache:apache /var/www/html/

# Install PHP
yum install -y php php-cli php-common php-devel php-mysql


# Install mysql
yum install -y mysql mysql-server mysql-devel
# chkconfig --add mysqld
# chkconfig mysqld on
systemctl enable mysql
# service mysql start
systemctl start mysql.service

mysql -e "SHOW DATABASES";

# service httpd start
systemctl start httpd.service

mkdir -p /home/content/
