#!/bin/bash
sudo yum install -y vim nano tar screen nmap ca-certificates net-tools telnet git

echo "192.168.10.25 master.com
192.168.10.26 namenode
192.168.10.27 datanode
192.168.10.28 resourcemanager
192.168.10.29 nodemanager1
192.168.10.30 historyserver" | sudo tee --append /etc/hosts

sudo hostnamectl set-hostname $1
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl enable firewalld
sudo systemctl start firewalld

sudo firewall-cmd --permanent --add-port=2376/tcp
sudo firewall-cmd --permanent --add-port=2377/tcp
sudo firewall-cmd --permanent --add-port=7946/tcp
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=7946/udp
sudo firewall-cmd --permanent --add-port=4789/udp

sudo firewall-cmd --reload
sudo systemctl restart docker


# sudo docker swarm init --advertise-addr  192.168.10.25

# sudo docker swarm join --token SWMTKN-1-58sg6tvuivmwcb1khxk4oet1vmmce27cwl27vfurlzipnqv5yd-e04k8eka6n3jgj2d6rnri585o 192.168.10.25:2377

