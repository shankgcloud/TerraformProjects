resource "aws_eip" "my_eip" {
  domain = "vpc"
}

resource "aws_security_group" "allow_https" {
  name = "Allow_HTTPS"

  tags = {
    Name = "Allow_HTTPS"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_eip" {
  security_group_id = aws_security_group.allow_https.id
  cidr_ipv4 = "${aws_eip.my_eip.public_ip}/32"
  from_port = 443
  to_port = 443
  ip_protocol = "tcp"
}