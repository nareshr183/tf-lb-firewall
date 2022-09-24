#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "The page is coming from women shopping server" | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/women
echo "Welcome to the womens Home page" | sudo tee /var/www/html/women/index.html
