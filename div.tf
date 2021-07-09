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
  region = "us-west-1"
}

resource "aws_instance" "my_ec2" {

  ami = "ami-04a3ae177de8477df"
  instance_type = "t2.micro"
  subnet_id = module.vpc.pri_sub
  instance_name = "terra_ec2"
}

module "vpc" {

 source = "terraform-aws-modules/vpc/aws"

 name = "vpc_1"

 cidr = "10.0.0.0/16"

 pub_sub = "10.0.0.0/24"

 pri_sub = "10.0.16.0/20"

 azs  = "us-west-1b"

 tags = {
    Terraform = "true"
    Environment = "dev"
  }



 enable_nat_gateway = true

 enable_vpn_gateway = true

