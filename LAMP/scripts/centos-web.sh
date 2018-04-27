#! /bin/bash

# IMPORTANT: All these commands are run as root, use sudo -u $user to change to another user

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

# service httpd start
systemctl start httpd.service

mkdir -p /home/content/

# Add the db-server to the hosts file
echo -e "192.168.10.3\tdb-server\tdb-server" >> /etc/hosts

#  Allow the login with ssh, solves the 'Permission denied (publickey,gssapi-keyex,gssapi-with-mic)' problem
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config # The -i makes it inline
systemctl restart sshd.service
