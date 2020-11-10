#!/bin/bash


sudo yum install -y wget

            ### Below 2 lines are written for java to point to latest version. After maven installation it is pointing to lower version.
            #sudo yum remove -y java-1.8.0-openjdk-devel
            #sudo yum install -y java-1.8.0-openjdk-devel

sudo yum install -y java-1.8.0-openjdk-devel
sudo yum install -y git

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig --add jenkins
sudo chmod 777 /var/run/docker.sock

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i 's/\$releasever/6/g' /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven

echo -e 1 | sudo alternatives --config java
echo -e 1 | sudo alternatives --config javac

#JENKINS_HOME=/var/jenkins_home
#sudo mkdir -p $JENKINS_HOME
#sudo chmod -R 777 $JENKINS_HOME

# Start Jenkins
#docker run -id --name jenkins -p 9090:8080 -v $JENKINS_HOME:/var/jenkins_home jenkins/jenkins:lts
