provider "aws" {

  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  subnet_id = aws_subnet.pubsub.id

  vpc_security_group_ids = [aws_security_group.sg.id]




  tags = {

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

  vpc_id = aws_vpc.main.id

  id = var.sg_ingress_rule.id

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

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "a" {



  subnet_id = aws_subnet.pubsub.id

  route_table_id = aws_route_table.example.id
}




resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route = []


  tags = {
    Name = "example"
  }

}
