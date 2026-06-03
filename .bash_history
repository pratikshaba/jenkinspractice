wget -o/etc/yum.repos.d/jenkins.repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install jenkins -y
yum install java -y
java -v
java --version
yum remove java -y
yum install java-25-amazon-corretto -y
java --version
yum install git -y
clear
java --version
git -v
jenkinsfile
vim jenkinsfile
