data "aws_route53_zone" "selected" {
  name         = "f1kart.com."
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "jenkins.f1kart.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ec2_jenkins.public_ip]
}
