#!/bin/bash


#extending volume

growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

xfs_growfs /
xfs_growfs /var


# installation of jenkins

curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins