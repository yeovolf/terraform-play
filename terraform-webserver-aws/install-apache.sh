sudo yum update
sudo install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Welcome to the terraform in world, This website was deploy following terraforme</h1>"|sudo tee /var/www/html
