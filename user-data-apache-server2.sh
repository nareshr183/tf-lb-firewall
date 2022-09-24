#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "The page is coming from men shopping server 2" | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/men
echo "Welcome to the Mens Home page" | sudo tee /var/www/html/men/index.html