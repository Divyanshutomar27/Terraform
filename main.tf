terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name

  version = "2.78.0"

  cidr =  var.vpc_cidr


  azs = var.vpc_azs

  private_subnets = var.vpc_private_sub

  public_subnets  = var.vpc_public_sub

  enable_nat_gateway = var.nat_gateway
  enable_vpn_gateway = var.igw_gateway

tags = var.vpc_tag

}


module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within vpc"
  vpc_id      = "vpc-0b85bc0c6a8535375"

  ingress_cidr_blocks = ["10.0.0.0/16"]
}



resource "aws_instance" "app_server" {
  ami           = "ami-0f6ddd5cd06387305"
  instance_type = "t2.micro"

 subnet_id = module.vpc.private_subnets[1]
  tags = {
    Name = var.instance_name
  }
}




