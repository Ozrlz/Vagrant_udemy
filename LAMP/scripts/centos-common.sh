#! /bin/bash

# IMPORTANT: All these commands are run as root, use sudo -u $user to change to another user

# Update the system
yum update -y

# Install utilities
yum install -y nano unzip screen wget nc telnet net-tools
