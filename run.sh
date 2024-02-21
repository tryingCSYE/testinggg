#!/bin/bash


# Install MySQL
sudo dnf install -y mysql-server
sudo systemctl enable mysqld
sudo systemctl start mysqld

# Secure MySQL Installation (The following is an example. You should secure your MySQL installation as per best practices.)
sudo mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'gali1999';FLUSH PRIVILEGES;"

# Install Node.js and npm
sudo dnf install -y unzip
sudo dnf module enable -y nodejs:20
sudo dnf install -y npm

sudo groupadd csye6225
sudo useradd -r -M -s /usr/sbin/nologin -g csye6225 csye6225

# Setup Webapp Directory and Unzip Contents
sudo mkdir -p /opt/webapp
sudo unzip /tmp/webapp.zip -d /opt/
sudo chown -R csye6225:csye6225 /opt/webapp

# Navigate to the webapp directory
cd /opt/webapp

# Install NPM dependencies
sudo  npm install

sudo npm test

# Move the service file into place
sudo mv /tmp/webapp.service /etc/systemd/system/webapp.service
sudo chown root:root /etc/systemd/system/webapp.service
sudo chmod 644 /etc/systemd/system/webapp.service

# Start the Webapp Service
sudo systemctl daemon-reload
sudo systemctl enable webapp.service
sudo systemctl start webapp.service
sudo systemctl status webapp.service




