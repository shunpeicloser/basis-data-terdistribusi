-- user for ProxySQL
CREATE USER 'monitor'@'%' IDENTIFIED BY 'password';
GRANT SELECT on sys.* to 'monitor'@'%';
FLUSH PRIVILEGES;

CREATE USER 'dbuser'@'%' IDENTIFIED BY 'dbpassword';
GRANT ALL PRIVILEGES on elaporan.* to 'dbuser'@'%';
FLUSH PRIVILEGES;