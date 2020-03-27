resource "aws_s3_bucket" "s3_jenkins" {

  bucket = "jenkins-release-artifacts.f1kart.com"

  acl = "private"

  tags = {
    Name = "cicd-jenkins-aws-terraform"
    owner = "terraform-cicd-jenkins-aws-terraform"
    project = "cicd-jenkins-aws-terraform"
  }
}