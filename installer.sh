echo "----------------------------------------------------------------------------------------------------------"
echo "Welcome to Ali Al-Zubidy One Click Docker CE & Kubernetes Installer v0.3"
echo "----------------------------------------------------------------------------------------------------------"
echo "Please enter the hostname based on /etc/hosts : "
read AZHOST
echo "Installing DOCKER CE......................................................................................" 
sudo subscription-manager repos --enable rhel-7-server-extras-rpms
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce
echo "Docker-CE Installed Successfully !!! ===================================================================="
echo "Installing Kubernetes ..................................................................................."
echo '[kubernetes]' > /etc/yum.repos.d/kubernetes.repo
echo 'name=Kubernetes'>> /etc/yum.repos.d/kubernetes.repo
echo 'baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64' >> /etc/yum.repos.d/kubernetes.repo
echo 'enabled=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'gpgcheck=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'repo_gpgcheck=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg' >> /etc/yum.repos.d/kubernetes.repo
echo '       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg' >> /etc/yum.repos.d/kubernetes.repo
yum -y install kubeadm kubelet kubectl
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
echo "Docker & Kubernetes successfully installed !!"
echo "If this is a master node, then start launcher.sh"
