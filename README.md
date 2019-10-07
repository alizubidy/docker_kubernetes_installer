# docker_kubernetes_installer
DockerCE &amp; Kubernetes Automatica Installer Script

These scripts will automatically install DockerCE & Kubernetes on your Redhat 7

Usage : 
1) Download the repo
2) Unzip 
3) Sudo su
4) Cd "azscript"
5) ./installer.sh

if you wanna config a master node, simply click 
6) ./launcher.sh

the script will automatically add Flannel , Dashboard UI , Create a an admin-user and provide you with the join command, the token, and dashboard link

<b>IMPORTANT NOTE : Please wait 1 minute before accessing the dashboard link while it boots up </b>
