resource "aws_security_group" "allow_all_traffic" {
  name   = "allow_all_traffic"
  vpc_id = module.network.vpc_id
  tags = {
    Name = "allow_all_traffic"
    env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ingress" {
  security_group_id = aws_security_group.allow_all_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_egress" {
  security_group_id = aws_security_group.allow_all_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
