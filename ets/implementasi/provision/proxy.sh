# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/provision/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

sudo apt-get install libaio1
sudo apt-get install libmecab2

sudo dpkg -i /vagrant/provision/proxysql_1.4.4-ubuntu16_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-client_5.7.23-1ubuntu16.04_amd64.deb

sudo ufw allow 33061
sudo ufw allow 3306

sudo systemctl start proxysql
# sudo mysql -u admin -padmin -h 127.0.0.1 -P 6032 < /vagrant/provision/proxy.sql