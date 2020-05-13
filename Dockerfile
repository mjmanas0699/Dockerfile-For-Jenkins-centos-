FROM centos:latest

RUN  yum -y install java-11-openjdk-devel && \
     yum -y install wget && \
     rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key && \
     wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo && \
     yum -y install jenkins &&\
     yum install -y initscripts &&\
     yum install sudo -y &&\
     yum install net-tools -y &&\
     sed -i '100i\jenkins ALL=(ALL)       NOPASSWD: ALL ' /etc/sudoers #>>THIS COMMAND IS USED TO PRINT ON SPECIFIC LINE

CMD /etc/rc.d/init.d/jenkins start   && /bin/bash

EXPOSE 8080
