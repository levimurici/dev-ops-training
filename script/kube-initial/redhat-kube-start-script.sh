sudo yum update && sudo yum upgrade

echo '--------------------------------'
echo '--------------------------------'
echo '----- Installing kubectl -------'
echo '--------------------------------'
echo '--------------------------------'

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl

kubectl version --client -ojson

sleep 2

echo '--------------------------------'
echo '--------------------------------'
echo '----- Installing packages ------'
echo '--------------------------------'
echo '--------------------------------'

echo ' ---- Please add on top of the file "/etc/yum.repos.d/docker-ce.repo": ----

                    [centos-extras]
                    name=Centos extras - $basearch
                    baseurl=http://mirror.centos.org/centos/7/extras/x86_64
                    enabled=1
                    gpgcheck=0

       --------------------------------------------------------------------------- '

sleep 3

sudo yum -y install slirp4netns fuse-overlayfs container-selinux