#!/bin/bash

sudo yum update -y

sudo yum install -y java
cd /home/ec2-user
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
su - ec2-user -c "java -jar jenkins.war &"
