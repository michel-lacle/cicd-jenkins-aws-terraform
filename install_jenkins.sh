#!/bin/bash

sudo yum update -y

sudo yum install java
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
java -jar jenkins.war