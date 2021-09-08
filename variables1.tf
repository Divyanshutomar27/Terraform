variable "instance_name" {

  description = "name of ec2 instance"
  type        = string
  default     = "my-ec2"

}


variable "instance_ami" {

  description = "ami of ec2 instance"
  type        = string
  default     = "ami-0d8d212151031f51c"

}


variable "instance_type" {

  description = "type of ec2 instance"
  type        = string
  default     = "t2.micro"

}



variable "vpc" {

  description = "vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"

}


variable "vpc_name" {

  description = "name of vpc"
  type        = string
  default     = "m-vpc"

}


variable "private_subnet" {

  description = "private subnet cidr block"
  type        = string
  default     = "10.0.10.0/24"

}

variable "privatesub_name" {

  description = "name of private subnet"
  type        = string
  default     = "privatesub"

}



variable "public_subnet" {

  description = "public subnet cidr block"
  type        = string
  default     = "10.0.0.0/24"

}

variable "publicsub_name" {

  description = "name of public subnet"
  type        = string
  default     = "publicsub"

}

variable "security_group_name" {

  description = "name of security group"
  type        = string
  default     = "m-sg"

}

variable "sg_ingress_rule" {

  description = "ingress rules of  security group"

  type = map(any)


  default = {


      "from_port"  = "22"
      "to_port"    = "22"
      "protocol"   = "tcp"
      "cidr_block" = "0.0.0.0/0"
    }

}
