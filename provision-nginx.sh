#!/bin/bash
echo "Starting Provision: Load balancer"
sudo yum install nginx -y
sudo systemctl start nginx
#sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/conf.d/load-balancer.conf
echo "upstream backend {
server 192.168.56.28;
server 192.168.56.29;
}
server {
listen 80 default_server;
listen [::]:80 default_server ipv6only=on;
server_name lb1.dev.com;
location / {
proxy_pass http://backend;
}
}" >> /etc/nginx/conf.d/load-balancer.conf
sudo systemctl restart nginx
echo "MACHINE: LOAD BALANCER" >> /usr/share/nginx/html/index.html
echo "Provision LB1 complete"
