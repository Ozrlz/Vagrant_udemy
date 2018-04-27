#! /bin/bash

# IMPORTANT: All these commands are run as root, use sudo -u $user to change to another user

# Install mysql
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
yum install -y mysql mysql-server mysql-devel
systemctl enable mysql
systemctl start mysql.service

# Test the mysql
mysql -e "SHOW DATABASES";

# Add the db-server to the hosts file
echo -e "192.168.10.3\tdb-server\tdb-server" >> /etc/hosts

#  Allow the login with ssh, solves the 'Permission denied (publickey,gssapi-keyex,gssapi-with-mic)' problem
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config # The -i makes it inline
systemctl restart sshd.service
