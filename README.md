# VagrantCogip

Vagrant project to deploy a **PHP** and **database** based website on a **Apache2** webserver with **.htaccess** rules and a reverse proxy for **HTTPS** connections.

**bootstrap.sh** is the shell script that installs and enables the dependencies : apache2, mysql, a2enmod (for .htaccess) a ssl certificate...

**apache2.conf**, **cogip.conf** and **dir.conf** are used to configure apache2 for the website : enable PHP and the VirtualHosts 
