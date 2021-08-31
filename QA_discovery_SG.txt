resource "aws_security_group" "DiscoverySG" {
  name        = "TCP"
  description = "Allow TCP inbound traffic"
  vpc_id      = *

  ingress = {
    {
      description      = "TCP from VPC"
      from_port        = 2503
      to_port          = 2503
      protocol         = "tcp"
      cidr_blocks      = ["10.42.13.36"]

    }
  }

  egress = [
    {
      from_port        = 2503
      to_port          = 2503
      protocol         = "tcp"
      cidr_blocks      = ["10.235.216.0/24", "10.235.219.0/24"]

    }
  ]

  tags = {
    Name = "allow_tcp"
  }
}
