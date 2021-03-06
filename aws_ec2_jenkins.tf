resource "aws_security_group" "ec2_jenkins_sg" {
  name = "ec2_jenkins_sg"
  description = "Allow ssh & http inbound traffic"
  vpc_id = "vpc-bb9f3bc0"

  ingress {
    description = "TLS from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "http traffic"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    owner = "terraform-cicd-jenkins-aws-terraform"
    project = "cicd-jenkins-aws-terraform"
  }
}

resource "aws_instance" "ec2_jenkins" {
  ami = "ami-0a887e401f7654935"
  instance_type = "t2.micro"

  # this is optional, but needed if you want to ssh into your ec2 instance
  # here I have manually created a key pair in the console and I'm supplying the
  # name.
  key_name = "cicd-jenkins-aws-terraform"

  user_data = file("install_jenkins.sh")

  iam_instance_profile = aws_iam_instance_profile.jenkins_instance_profile.id

  vpc_security_group_ids = [
    aws_security_group.ec2_jenkins_sg.id]

  tags = {
    Name = "cicd-jenkins-aws-terraform"
    owner = "terraform-cicd-jenkins-aws-terraform"
    project = "cicd-jenkins-aws-terraform"
  }
}
