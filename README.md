# docker_kubernetes_installer
DockerCE &amp; Kubernetes Automatica Installer Script

These scripts will automatically install DockerCE & Kubernetes on your Redhat 7

Usage : 
1) Download the repo
2) Unzip 
3) Sudo su
4) Cd "azscript"
5) ./installer.sh
6) Provide your hostname as set in the /etc/hosts file

if you wanna config a master node, simply click 
6) ./launcher.sh
7) Provide you local "NON ROOT" username 
8) Provide your hostname as set in the /etc/hosts file
9) Click on the link and use the generated token to access the UI

the script will automatically add Flannel , Dashboard UI , Create a an admin-user and provide you with the join command, the token, and dashboard link

<b>IMPORTANT NOTE : Please wait 1 minute before accessing the dashboard link while it boots up </b>


<h3> The output should be something like </h3>

JOIN CMD : 
kubeadm join 192.168.109.139:6443 --token kyy8xh.kw1fhlp2oo0naw8g     --discovery-token-ca-cert-hash sha256:345cc48cd23106b37ed43f189b077cdf56163bd28ef19fbf2d77072091a252b1 
------------------------------------------------------------------------------------------------------------------------------------------------------
TOKEN : 

token:      eyJhbGciOiJSUzI1NiIsImtpZCI6InZrRXBGMktiU1dvaUNBTmgzQ1pVVW1KZmlBUDlnaHRnWE1QUnlpbmM5c1kifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuLWxqdmNuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiIxOWM5Njc5Yy01N2Q5LTRhOTMtOTBhYy03ZDEzZTcxYjI1Y2MiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.T_qVRExWK1pWlX5O4OC0jvVE2vwvRrZibsOmGVn0oovgzxDZYchK9Kzjld3dpzT4BMgC0unecG1WRVzqkqU0j1A-vJtNFi6cDDnCXsP1vI_cutojsP4Is62TdeP02SXiUh1C9yvemF-RfG3Vr3zW2A7rvB6m0G3iBH5kj1oHN0_zrBt_yLs6Rt9FauY2dVzmwZT4bk1CEL6gItVJMloeHOn3SXtrx7DpqMM3Ck4DnYdgMzF382DtyElpjBaPmeJbxgKVkYWjPS40lnQaMFKm6Vnbgph_fK09I7pffaOQJhsMpyPn278-pX01aMQUTHZYmfCRGj1G3jHnd_IwjFaKWw
------------------------------------------------------------------------------------------------------------------------------------------------------
Access Link : 
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default
------------------------------------------------------------------------------------------------------------------------------------------------------



