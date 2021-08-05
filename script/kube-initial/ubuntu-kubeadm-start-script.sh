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
echo '-------- Installing Docker on nodes -----------'
echo '-----------------------------------------------'
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sleep 2

echo '-----------------------------------------------'
echo '-------- Docker installed on nodes ------------'
echo '-----------------------------------------------'

sudo mkdir /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

echo '-----------------------------------------------'
echo '--------- Enabling Docker on nodes ------------'
echo '-----------------------------------------------'

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
