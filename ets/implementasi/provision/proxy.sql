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

-- mysql -u playgrounduser -p -h 127.0.0.1 -P 6033 --prompt='ProxySQLClient> '
-- SELECT hostgroup_id, hostname, status FROM runtime_mysql_servers; -- check host
-- SELECT @@hostname; -- check connected hostname