# Evaluasi Tengah Semester Mata Kuliah Basis Data Terdistribusi #
## Design and Implementation ##
- [Desain infrastruktur](https://github.com/shunpeicloser/basis-data-terdistribusi/tree/master/ets/desain)
- [Implementasi Basis Data](https://github.com/shunpeicloser/basis-data-terdistribusi/tree/master/ets/implementasi)

## Development Environment ##
Linux Mint 19.1 Teressa 8GB 64-bit

## Requirements ##
- Virtual Box
- Vagrant
- PHP 7.2
- Mysql dan ProxySQL + addition_to_sys.sql
- ProxySQL + addition_to_sys.sql (File diletakkan dalam folder 'Provision')
- Web App ([E-Laporan](https://github.com/rtejakusuma/elaporan))

## Outline ##
- Instalasi requirement dan persiapan
- Pembuatan dan pengaturan Vagrantfile
- Pembuatan shell script dan file konfigurasi MySQL untuk provisioning
- Pembuatan SQL script untuk pengaturan group replication
- Pembuatan SQL script untuk pengaturan ProxySQL
- Mengenai Web App E-laporan dan Pengaturan Web App
- Pembuatan VM menggunakan Vagrant
- Bootstrapping basis data pada server
- Pengaturan ProxySQL
- Menjalankan Web Server

## Instalasi Requirement dan Persiapan ##
- Virtual Box
 ```bash
sudo apt-get install virtualbox
 ```
- Vagrant
 ```bash
sudo apt-get install vagrant
 ```
- PHP 7.2
 ```bash
sudo apt-get install php7.2
 ```
- Mysql dan ProxySQL + addition_to_sys.sql (File diletakkan dalam folder 'Provision')
 ```bash
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-client_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://github.com/sysown/proxysql/releases/download/v1.4.4/proxysql_1.4.4-ubuntu16_amd64.deb

mv mysql-* [path_to_vagrantfile]/provision
mv proxysql* [path_to_vagrantfile]/provision
 ```
 File addition_to_sys.sql:
 ```sql
USE sys;

DELIMITER $$

CREATE FUNCTION IFZERO(a INT, b INT)
RETURNS INT
DETERMINISTIC
RETURN IF(a = 0, b, a)$$

CREATE FUNCTION LOCATE2(needle TEXT(10000), haystack TEXT(10000), offset INT)
RETURNS INT
DETERMINISTIC
RETURN IFZERO(LOCATE(needle, haystack, offset), LENGTH(haystack) + 1)$$

CREATE FUNCTION GTID_NORMALIZE(g TEXT(10000))
RETURNS TEXT(10000)
DETERMINISTIC
RETURN GTID_SUBTRACT(g, '')$$

CREATE FUNCTION GTID_COUNT(gtid_set TEXT(10000))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE result BIGINT DEFAULT 0;
  DECLARE colon_pos INT;
  DECLARE next_dash_pos INT;
  DECLARE next_colon_pos INT;
  DECLARE next_comma_pos INT;
  SET gtid_set = GTID_NORMALIZE(gtid_set);
  SET colon_pos = LOCATE2(':', gtid_set, 1);
  WHILE colon_pos != LENGTH(gtid_set) + 1 DO
     SET next_dash_pos = LOCATE2('-', gtid_set, colon_pos + 1);
     SET next_colon_pos = LOCATE2(':', gtid_set, colon_pos + 1);
     SET next_comma_pos = LOCATE2(',', gtid_set, colon_pos + 1);
     IF next_dash_pos < next_colon_pos AND next_dash_pos < next_comma_pos THEN
       SET result = result +
         SUBSTR(gtid_set, next_dash_pos + 1,
                LEAST(next_colon_pos, next_comma_pos) - (next_dash_pos + 1)) -
         SUBSTR(gtid_set, colon_pos + 1, next_dash_pos - (colon_pos + 1)) + 1;
     ELSE
       SET result = result + 1;
     END IF;
     SET colon_pos = next_colon_pos;
  END WHILE;
  RETURN result;
END$$

CREATE FUNCTION gr_applier_queue_length()
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN (SELECT sys.gtid_count( GTID_SUBTRACT( (SELECT
Received_transaction_set FROM performance_schema.replication_connection_status
WHERE Channel_name = 'group_replication_applier' ), (SELECT
@@global.GTID_EXECUTED) )));
END$$

CREATE FUNCTION gr_member_in_primary_partition()
RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
  RETURN (SELECT IF( MEMBER_STATE='ONLINE' AND ((SELECT COUNT(*) FROM
performance_schema.replication_group_members WHERE MEMBER_STATE != 'ONLINE') >=
((SELECT COUNT(*) FROM performance_schema.replication_group_members)/2) = 0),
'YES', 'NO' ) FROM performance_schema.replication_group_members JOIN
performance_schema.replication_group_member_stats USING(member_id));
END$$

CREATE VIEW gr_member_routing_candidate_status AS SELECT
sys.gr_member_in_primary_partition() as viable_candidate,
IF( (SELECT (SELECT GROUP_CONCAT(variable_value) FROM
performance_schema.global_variables WHERE variable_name IN ('read_only',
'super_read_only')) != 'OFF,OFF'), 'YES', 'NO') as read_only,
sys.gr_applier_queue_length() as transactions_behind, Count_Transactions_in_queue as 'transactions_to_cert' from performance_schema.replication_group_member_stats;$$

DELIMITER ;
 ```
- Web App: E-Laporan

Repositori Web app asal. Web App dengan konfigurasi yang sesuai untuk implementasi ini disimpan dalam direktori elaporan repositori ini.
 ```bash
git clone https://github.com/rtejakusuma/elaporan.git
 ```

## Pembuatan dan Pengaturan Vagrantfile ##
Vagrantfile:
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.define "server1" do |server1|
    server1.vm.box = "bento/ubuntu-16.04"
    server1.vm.hostname = "server1"

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    server1.vm.network "forwarded_port", guest: 3306, host: 33060

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    server1.vm.network "private_network", ip: "192.168.16.16"

    server1.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "256"
    end

    server1.vm.provision "shell", path: "provision/server1.sh", privileged: false

  end

  config.vm.define "server2" do |server2|
    server2.vm.box = "bento/ubuntu-16.04"
    server2.vm.hostname = "server2"

    server2.vm.network "forwarded_port", guest: 3306, host: 33061

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    server2.vm.network "private_network", ip: "192.168.16.17"

    server2.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "256"
    end

    server2.vm.provision "shell", path: "provision/server2.sh", privileged: false

  end

  config.vm.define "server3" do |server3|
    server3.vm.box = "bento/ubuntu-16.04"
    server3.vm.hostname = "server3"

    server3.vm.network "forwarded_port", guest: 3306, host: 33062

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    server3.vm.network "private_network", ip: "192.168.16.18"

    server3.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "256"
    end

    server3.vm.provision "shell", path: "provision/server3.sh", privileged: false

  end

  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "bento/ubuntu-16.04"
    proxy.vm.hostname = "proxy"

    proxy.vm.network "forwarded_port", guest: 6033, host: 60330

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    proxy.vm.network "private_network", ip: "192.168.16.240"

    proxy.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    
      # Customize the amount of memory on the VM:
      vb.memory = "256"
    end

    proxy.vm.provision "shell", path: "provision/proxy.sh", privileged: false

  end

end
```
## Pembuatan Shell Script dan File Konfigurasi MySQL untuk Provisioning ##
Shell script untuk provisioning vm yang akan dibuat. Sesuaikan nama file konfigurasi mysql (.cnf) yang di-copy-kan ke /etc/mysql/ sesuai server yang di-provisioning.

Shell script untuk masing-masing server (```server1.sh, server2.sh, server3.sh```)
```bash
# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/provision/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

# Install required library
sudo apt-get install libaio1
sudo apt-get install libmecab2

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
# Copy the right mysql configuration per server
sudo cp /vagrant/provision/server1.cnf /etc/mysql/my.cnf

# Restart MySQL services
sudo service mysql restart
```

File Konfigurasi MySQL (server1.cnf, server2.cnf, server.cnf)
```
#
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#

!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/

[mysqld]

# General replication settings
gtid_mode = ON
enforce_gtid_consistency = ON
master_info_repository = TABLE
relay_log_info_repository = TABLE
binlog_checksum = NONE
log_slave_updates = ON
log_bin = binlog
binlog_format = ROW
transaction_write_set_extraction = XXHASH64
loose-group_replication_bootstrap_group = OFF
loose-group_replication_start_on_boot = ON
loose-group_replication_ssl_mode = REQUIRED
loose-group_replication_recovery_use_ssl = 1

# Shared replication group configuration
loose-group_replication_group_name = "fac430b6-caac-436f-ad45-b2b0a35748d1"
loose-group_replication_ip_whitelist = "192.168.16.16, 192.168.16.17, 192.168.16.18"
loose-group_replication_group_seeds = "192.168.16.16:33061, 192.168.16.17:33061, 192.168.16.18:33061"

# Single or Multi-primary mode? Uncomment these two lines
# for multi-primary mode, where any host can accept writes
loose-group_replication_single_primary_mode = OFF
loose-group_replication_enforce_update_everywhere_checks = ON

# Host specific replication configuration
server_id = 1
bind-address = "192.168.16.16" # Change according to which server is used
report_host = "192.168.16.16" # Change according to which server is used
loose-group_replication_local_address = "192.168.16.16:33061" # Change according to which server is used
```

loose-group_replication_group_name didapatkan dengan menjalankan perintah ```uuid``` pada terminal linux.

## Pembuatan SQL Script untuk Pengaturan Group Replication ##
Dilakukan pembuatan user yang digunakan untuk melakukan replikasi dan melakukan instalasi plugin group replication.

File cluster_bootstrap_setting.sql:
```sql
SET SQL_LOG_BIN=0;
CREATE USER 'repl'@'%' IDENTIFIED BY 'password' REQUIRE SSL;
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
SET SQL_LOG_BIN=1;
CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='password' FOR CHANNEL 'group_replication_recovery';
INSTALL PLUGIN group_replication SONAME 'group_replication.so';
```
Pada keadaan dimana tidak ada node dalam group replication yang menyala, dijalankan group replication bootstrap yang diikuti dengan perintah untuk memulai group replication. Group replication bootstrap dihentikan setelah group replication berjalan.

File start_replication_bootstrap.sql:
```sql
SET GLOBAL group_replication_bootstrap_group=ON;
START group_replication;
SET GLOBAL group_replication_bootstrap_group=OFF;
```
Pada node selain node pertama cukup dijalankan perintah untuk menjalankan group replication.

File start_replication.sql:
```sql
START group_replication;
```
Buat user yang akan digunakan oleh ProxySQL untuk melakukan monitor dan mengakses basis data ke database server1 hingga server3.

File db_proxy_user:
```sql
-- user for ProxySQL
CREATE USER 'monitor'@'%' IDENTIFIED BY 'password';
GRANT SELECT on sys.* to 'monitor'@'%';
FLUSH PRIVILEGES;

CREATE USER 'dbuser'@'%' IDENTIFIED BY 'dbpassword';
GRANT ALL PRIVILEGES on elaporan.* to 'dbuser'@'%';
FLUSH PRIVILEGES;
```

## Pembuatan SQL Script untuk Pengaturan ProxySQL ##
Pada proxy server, buat akun admin, monitor, dan user database yang diinginkan. Selain itu masukkan alamat dari database server yang akan dihubungkan ke ProxySQL.

File proxy.sql:
```sql
UPDATE global_variables SET variable_value='admin:admin'
WHERE variable_name='admin-admin_credentials';

LOAD ADMIN VARIABLES TO RUNTIME;
SAVE ADMIN VARIABLES TO DISK;

UPDATE global_variables SET variable_value='monitor'
WHERE variable_name='mysql-monitor_username';

LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;

INSERT INTO mysql_group_replication_hostgroups (writer_hostgroup, backup_writer_hostgroup, reader_hostgroup, offline_hostgroup, active, max_writers, writer_is_also_reader, max_transactions_behind) 
VALUES (2, 4, 3, 1, 1, 3, 1, 100);

INSERT INTO mysql_servers(hostgroup_id, hostname, port)
VALUES (2, '192.168.16.16', 3306), (2, '192.168.16.17', 3306), (2, '192.168.16.18', 3306);

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

INSERT INTO mysql_users(username, password, default_hostgroup)
VALUES ('dbuser', 'dbpassword', 2);

LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;
```

## Mengenai Web App E-Laporan dan Pengaturan Web App ##
Web App E-Laporan merupakan aplikasi yang akan digunakan untuk melakukan pemusatan laporan seluruh perangkat daerah Kota Madiun. Perangkat daerah dapat membuat laporan yang diinginkan dengan mengisikan data yang diperlukan dan dapat menyimpan laporan yang telah dibuat. Sedangkan administrator web dapat mendaftarkan akun baru, mengubah kata sandi dari akun yang sudah ada, dan menetapkan jenis laporan yang dapat dibuat oleh perangkat daerah.

Pengimplementasian web app dengan basis data terdistribusi ini dapat dilakukan dengan melakukan pengubahan hostname, username, password, dan database dalam File database.php (dalam direktori config).
```php
$db['bdt'] = array(
	'dsn'	=> '',
	'hostname' => '127.0.0.1:60330',
	'username' => 'dbuser',
	'password' => 'dbpassword',
	'database' => 'elaporan',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
```

Ubah variabel $active_group pada file yang sama menjadi bdt.
```php
...
$active_group = 'bdt';
$query_builder = TRUE;

$db['bdt'] = array(
...
```

## Pembuatan VM Menggunakan Vagrant ##
Buat VM dengan menjalankan perintah berikut.
```bash
vagrant up
```

Jika proses pembuatan VM sudah selesai lanjutkan ke bagian "Bootstrapping Basis Data pada Server".

## Bootstrapping Basis Data pada Server ##
Lakukan ssh ke salah satu database server (server1 / server2 / server3), pada contoh ini digunakan server1, menggunakan perintah
```bash
vagrant ssh server1
```

Tambahkan akun user yang akan digunakan untuk replikasi dan lakukan instalasi group replication plugin.
```bash
sudo mysql -u root -padmin < /vagrant/provision/cluster_bootstrap_setting.sql
```

Database server pertama akan digunakan untuk bootstrap group replication dengan menjalankan perintah
```bash
sudo mysql -u root -padmin < /vagrant/provision/start_replication_bootstrap.sql
```

Jalankan file addition_to_sys.sql dan tambahkan user yang akan digunakan oleh ProxySQL ke server1.
```bash
sudo mysql -u root -padmin < /vagrant/provision/addition_to_sys.sql
sudo mysql -u root -padmin < /vagrant/provision/db_proxy_user.sql
```

Masukkan basis data dari web app.
```ssh
sudo mysql -u root -padmin < /vagrant/provision/cluster_bootstrap_db.sql
```

Karena server1 telah digunakan sebagai bootstrap group replication, untuk server2 dan server3 cukup menjalankan perintah berikut.
```bash
sudo mysql -u root -padmin < /vagrant/provision/start_replication.sql
```

## Pengaturan ProxySQL ##
Pada server ProxySQL tambahkan user yang akan digunakan untuk mengakses database server beserta pengaturan MySQL server yang terhubung ke ProxySQL.
```bash
sudo mysql -u admin -padmin -h 127.0.0.1 -P 6032 < /vagrant/provision/proxy.sql
```

## Menjalankan Web Server ##
Pada pengujian ini PHP digunakan sebagai web server (hanya untuk local). Jalankan perintah berikut pada direktori web app.
```bash
php -S localhost:8000
```

Web app dapat diakses menggunakan localhost:8000.