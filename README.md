# VagrantCogip

Vagrant project to deploy a **PHP** and **database** based website on a **Apache2** webserver with **.htaccess** rules and a reverse proxy for **HTTPS** connections.

**bootstrap.sh** is the shell script that installs and enables the dependencies : apache2, mysql, a2enmod (for .htaccess) a ssl certificate...

**apache2.conf**, **cogip.conf** and **dir.conf** are used to configure apache2 for the website : enable PHP and the VirtualHosts.

About the database : 

```
sudo mysql --execute='source /vagrant/cogip/database/cogip.sql'
sudo mysql --execute="ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
```

These lines run the CREATE TABLES SQL file to build the DB and changes the root password in order to fit the dbconnect() function of the website :

*VagrantCogip/cogip/database/connection.php*

```
$usernamedb = "root";
$passworddb = "root";
```
