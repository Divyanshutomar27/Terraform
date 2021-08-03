variable "instance_name" {

  description = "name of ec2 instance"
  type        =  string
  default     = "my-ec2"

}


variable "instance_ami" {

  description = "ami of ec2 instance"
  type        =  string
  default     = "ami-0d8d212151031f51c"

}


variable "instance_type" {

  description = "type of ec2 instance"
  type        =  string
  default     =  "t2.micro"

}



variable "vpc" {

  description = "vpc cidr block"
  type        =  string
  default     =  "10.0.0.0/16"

}


variable "vpc_name" {

  description = "name of vpc"
  type        =  string
  default     = "m-vpc"

}


variable "private_subnet" {

  description = "private subnet cidr block"
  type        =  string
  default     = "10.0.10.0/24"

}

variable "privatesub_name" {

  description = "name of private subnet"
  type        =  string
  default     = "privatesub"

}



variable "public_subnet" {

  description = "public subnet cidr block"
  type        =  string
  default     = "10.0.0.0/24"

}

variable "publicsub_name" {

  description = "name of public subnet"
  type        =  string
  default     = "publicsub"

}

variable "security_group_name" {

  description = "name of security group"
  type        =  string
  default     = "m-sg"

}

variable "ec2_key_pair" {

  description = "Key pair"
  type        =  string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}


variable "key_pair" {

  description = "Key pair name"
  type        =  string
  default     = "deployer"
 }
