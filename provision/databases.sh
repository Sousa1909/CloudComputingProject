#!/bin/bash

sudo apt-get update

#sudo apt-get install -y nginx

sudo apt-get install -y php-fpm php-common php-cli php-mysql php-pgsql php-pdo php-mbstring php-zip zip unzip

#sudo systemctl restart nginx

sudo apt-get install -y postgresql postgresql-contrib php-pgsql

sudo -u postgres psql -c "CREATE USER myuser WITH PASSWORD 'mypassword';"
sudo -u postgres psql -c "CREATE DATABASE mydatabase OWNER myuser;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;"

#sudo systemctl restart postgresql

sudo -u postgres psql -d mydatabase -f /vagrant/provision/dump.sql

sudo -u postgres psql -d mydatabase -c "GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE messages TO myuser;"
sudo -u postgres psql -d mydatabase -c "GRANT USAGE, SELECT, UPDATE ON SEQUENCE messages_id_seq TO myuser;"
sudo -u postgres psql -d mydatabase -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO myuser;"
sudo -u postgres psql -d mydatabase -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO myuser;"
sudo -u postgres psql -d mydatabase -c "GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;"

#sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/14/main/postgresql.conf


#sudo sh -c "echo 'host    all    all    192.168.33.48/28    scram-sha-256' >> /etc/postgresql/14/main/pg_hba.conf"

sudo -u postgres psql -c "\du"
sudo -u postgres psql -c "\list"
sudo -u postgres psql -d mydatabase -c "\dt"

#sudo systemctl restart postgresql

cd /vagrant/app
ISO_DATE=$(TZ=Europe/Lisbon date -Iseconds)
sed -i "s/^DEPLOY_DATE=.*/DEPLOY_DATE=\"$ISO_DATE\"/" .env
