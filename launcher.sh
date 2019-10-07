echo "------------------------------------------------------------------------------------------------------------------"
echo "Welcome to Ali Al-Zubidy automated Kubernetes reset script v0.3"
echo "------------------------------------------------------------------------------------------------------------------"
echo "Please enter you NONE-ROOT USERNAME : "
read NONROOTUSERNAME
echo "Please enter the hostname based on /etc/hosts : "
read AZHOST
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo echo 1 > /proc/sys/net/bridge/bridge-nf-call-ip6tables 
sudo echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables 
sudo swapoff -a
sudo service firewalld stop
sudo hostnamectl set-hostname $AZHOST
sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo modprobe br_netfilter
sudo systemctl restart docker && systemctl enable docker
sudo systemctl  restart kubelet && systemctl enable kubelet
sudo kubeadm reset
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
sudo mkdir -p /home/$NONROOTUSERNAME/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config && sudo chown $NONROOTUSERNAME /home/$NONROOTUSERNAME/.kube/config
sudo kubectl apply -f kube-flannel.yml --validate=false
sudo kubectl -n kube-system -l=k8s-app=kube-dns get pods
sudo kubectl delete ns kubernetes-dashboard
sudo kubectl apply -f kubernetes-dashboard.yaml --validate=false
sudo kubectl apply -f ./dashboard-adminuser.yml --validate=false
sudo kubectl apply -f admin-role-binding.yml --validate=false
echo "JOIN CMD : " 
sudo kubeadm token create --print-join-command
echo "------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "TOKEN : " 
sudo kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
echo "------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Access Link : " 
#echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
#echo "http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default"
echo "------------------------------------------------------------------------------------------------------------------------------------------------------"
echo "Starting KubeProxy"
sudo kubectl proxy

