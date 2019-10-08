# docker_kubernetes_installer
DockerCE &amp; Kubernetes Automatica Installer Script

These scripts will automatically install DockerCE & Kubernetes on your Redhat 7

Usage : 
1) Download the repo
2) Unzip 
3) Sudo su
4) ./installer.sh
5) Provide your hostname as set in the /etc/hosts file
6) ./launcher.sh (optional if you wanna config a master node)
7) Provide you local "NON ROOT" username 
8) Provide your hostname as set in the /etc/hosts file
9) Click on the link and use the generated token to access the UI

the script will automatically add Flannel , Dashboard UI , Create a an admin-user and provide you with the join command, the token, and dashboard link

<b>IMPORTANT NOTE : Please wait 1 minute before accessing the dashboard link while it boots up </b>


<h3> The output should be something like </h3>

JOIN CMD : 
kubeadm join 192.168.109.139:6443 --token kyy8xh.kw1fhlp2oo0naw8g     --discovery-token-ca-cert-hash sha256:345cc48cd23106b37
------------------------------------------------------------------------------------------------------------------------------------------------------
TOKEN : 

token:      eyJhbGciOiJSUzI1NiIsIm
------------------------------------------------------------------------------------------------------------------------------------------------------
Access Link : 
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default
------------------------------------------------------------------------------------------------------------------------------------------------------



