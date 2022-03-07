sudo apt update
sudo apt install -y apache2
sudo apt install -y mysql-server
sudo mysql --execute='source /vagrant/cogip/database/cogip.sql'
sudo mysql --execute="ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
sudo apt install -y php libapache2-mod-php php-mysql
sudo cp /vagrant/dir.conf /etc/apache2/mods-enabled/
sudo systemctl restart apache2
sudo a2enmod rewrite
sudo cp /vagrant/apache2.conf /etc/apache2/
sudo systemctl restart apache2
sudo a2enmod ssl
sudo apt install -y openssl
sudo apt install libnss3-tools -y
sudo wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo cp mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
sudo mkcert -install
sudo mkcert localhost
sudo mkdir /etc/apache2/certs
sudo mv localhost.pem /etc/apache2/certs
sudo mv localhost-key.pem /etc/apache2/certs
sudo cp /vagrant/cogip.conf /etc/apache2/sites-available/
sudo a2ensite cogip.conf
sudo a2dissite 000-default.conf
sudo systemctl reload apache2
