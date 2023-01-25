echo "Starting Provision on B"
sudo yum install -y nginx
echo "<h1>MACHINE: B</h1>" >> /usr/share/nginx/html/index.html
sudo systemctl restart nginx
echo "Provision B complete"
