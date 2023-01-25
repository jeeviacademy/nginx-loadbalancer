require 'socket'

hostname = Socket.gethostname
localmachineip = IPSocket.getaddress(Socket.gethostname)
puts %Q{ This machine has the IP '#{localmachineip} and host name '#{hostname}'}

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = '2'
#variables par défaut
centos_box_name = 'centos/7'
NETWORK_BASE = '192.168.56'
INTEGRATION_START_SEGMENT = 27

$miscellany = <<SCRIPT
sudo yum install -y epel-release
yum -y install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct nfs-utils
yum clean all ; yum repolist
yum -y update
echo "redhat" | sudo passwd root --stdin
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
yum -y install docker
systemctl enable docker
systemctl start docker
# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo systemctl enable --now kubelet
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
echo 1 > /proc/sys/net/ipv4/ip_forward
swapoff -a
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false

  config.landrush.enabled = true
  config.landrush.tld = 'dev.com'
  config.landrush.guest_redirect_dns = false 

  config.vm.provider "virtualbox" do |v|
     v.memory = 1500
     v.cpus = 1
  end
 

  config.vm.define :lb1 do |lb1|
    lb1.vm.box = centos_box_name
    lb1.vm.network :private_network, ip: "#{NETWORK_BASE}.#{INTEGRATION_START_SEGMENT}"
    lb1.vm.hostname = "lb1.dev.com"
    lb1.vm.network "forwarded_port", guest: 80, host: 7777, host_ip: "127.0.0.1"
    auto_correct = true
    lb1.vm.provision "shell", path: "provision-nginx.sh"
  end

  config.vm.define :web1 do |web1|
    web1.vm.box = centos_box_name
    web1.vm.network :private_network, ip: "#{NETWORK_BASE}.#{INTEGRATION_START_SEGMENT + 1}"
    web1.vm.hostname = "web1.dev.com"
    web1.vm.network "forwarded_port", guest: 80, host: 8888, host_ip: "127.0.0.1"
    web1.vm.provision "shell", path: "provision-web1.sh"
  end
 
  config.vm.define :web2 do |web2|
    web2.vm.box = centos_box_name
    web2.vm.network :private_network, ip: "#{NETWORK_BASE}.#{INTEGRATION_START_SEGMENT + 2}"
    web2.vm.hostname = "web2.dev.com"
    web2.vm.network "forwarded_port", guest: 80, host: 9999, host_ip: "127.0.0.1"
    web2.vm.provision "shell", path: "provision-web2.sh"
    auto_correct = true
  end


config.vm.provision "shell", inline: $miscellany

end
