echo "Starting Provision on A"
sudo yum install -y nginx
echo "<h1>MACHINE: A</h1>" >> /usr/share/nginx/html/index.html
sudo systemctl restart nginx
echo "Provision A complete"
