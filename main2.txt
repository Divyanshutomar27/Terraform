provider aws {

  region = "us-east-2"
       }

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.prisub.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name   = aws_key_pair.deployer.id



  tags =  {

  Name = var.instance_name
}

}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "prisub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet

  tags = {
    Name = var.privatesub_name
  }
}

resource "aws_subnet" "pubsub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet

  tags = {
    Name = var.publicsub_name
  }
}


resource "aws_security_group" "sg" {

  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

tags = {
    Name = var.security_group_name
  }
}

resource "aws_key_pair" "deployer" {
   tags = {

        Name  = var.key_pair

}
   public_key = var.ec2_key_pair

}
