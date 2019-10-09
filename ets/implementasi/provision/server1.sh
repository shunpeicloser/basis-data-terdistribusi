# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/provision/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

# Install required library
sudo apt-get install libaio1
sudo apt-get install libmecab2

# Get MySQL binaries
# curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
# curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
# curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-client_5.7.23-1ubuntu16.04_amd64.deb
# curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server_5.7.23-1ubuntu16.04_amd64.deb

# Setting input for installation
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password admin'
sudo debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password admin'

# Install MySQL Community Server
sudo dpkg -i /vagrant/provision/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i /vagrant/provision/mysql-community-server_5.7.23-1ubuntu16.04_amd64.deb

# Allow port on firewall
sudo ufw allow 33061
sudo ufw allow 3306

# Copy MySQL configurations
sudo mv /etc/mysql/my.cnf /etc/mysql/my.cnf.backup 
sudo cp /vagrant/provision/server1.cnf /etc/mysql/my.cnf

# Restart MySQL services
sudo service mysql restart

# Cluster bootstrapping
sudo mysql -u root -padmin < /vagrant/provision/cluster_bootstrap_setting.sql
sudo mysql -u root -padmin < /vagrant/provision/start_replication_bootstrap.sql
sudo mysql -u root -padmin < /vagrant/provision/addition_to_sys.sql
sudo mysql -u root -padmin < /vagrant/provision/db_proxy_user.sql
# sudo mysql -u root -padmin < /vagrant/provision/cluster_bootstrap_db.sql
# sudo mysql -u root -padmin < /vagrant/provision/create_proxysql_user.sql