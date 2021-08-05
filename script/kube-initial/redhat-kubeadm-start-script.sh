sudo yum -y update

echo '-----------------------------------------------'
echo '---- Letting iptables see bridged traffic -----'
echo '-----------------------------------------------'

sudo modprobe br_netfilter

sleep 1

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

sleep 1

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

sleep 1

echo '-----------------------------------------------'
echo '------------- Installing Docker  --------------'
echo '-----------------------------------------------'

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sleep 1

sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sleep 1

sudo yum -y update

sudo yum install -y docker-ce docker-ce-cli containerd.io