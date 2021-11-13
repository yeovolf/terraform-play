variable "aws_region" {
  description = "region value"
  type = string
  # default = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "vpc network id"
  type = string
  # default = "10.0.0.0/16"
}
#  azs             = ["us-east-1a", "us-east-1b"]
variable "vpc_availability_zone" {
  description = "list of availability zone for my subnets"
  type = list(string)
  # default = ["us-east-1a","us-east-1b"]  
}
variable "vpc_name" {
  description = "vpc name"
  type = string
  # default = "Diligent-vpc"
  
}

  # public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
variable "vpc_pub_sub_cidr_block" {
  description = "creating a variable to hold a cidr_block of my public subnet on my account"
  type = list(string)
  # default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_priv_sub_cidr_block" {
  description = "creating a variable to hold a cidr_block of my private subnet on my account"
  type = list(string)
  # default = ["10.0.1.0/24", "10.0.2.0/24"]

}

  # public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  #  ami                    = "ami-ebd02392"
  # instance_type          = "t2.micro"
variable "instance_type_map" {
  description = "list of aws instance type"
  type = map(string)
  # default = {
  #   "dev" = "t3.micro" 
  #   "qa" = "t2.micro" 
  #   "prod" = "t2.small"
  # }
}



  # key_name               = "user1"
variable "instance_key_pair" {
  description = "instance key"
  type = string
  # default = "Public_Subnet_EC2"
}

variable "vpc_database_subnets_cidr" {
  description = "creating a variable to hold a cidr_block of database subnet on my account"
  type = list(string)
  # default = ["10.0.21.0/24", "10.0.22.0/24"]

}

variable "instance_count" {
  # default = "2"
}

variable "instance_tags" {
  type = list
  # default = ["private-1", "Pravate-2"]
}

variable "ingress_cidr_blocks" {
  type = list(string)
  # default = [ "10.0.0.0/16" ]

  
}
variable "vpc_create_database_subnet_route_table" {
  description = "create vpc database subnets route table"
  type = bool
  # default = true
  
}
variable "vpc_create_database_subnet_group" {
  description = "create vpc database subnets group"
  type = bool
  # default = true
  
}
variable "vpc_enable_nat_gateway" {
  description = "enable natgw"
  type = bool
  # default = true
}

variable "vpc_enable_single_nat_gateway" {
  description = "enable natgw in 1 vpc"
  type = bool
  # default = true
}

variable "vpc_enable_single_nat_gateway_per_az" {
  description = "enable natgw per az"
  type = bool
  # default = true
}

variable "vpc_enable_dns_support" {
  description = "enable dns support"
  type = bool
  # default = true
}

variable "vpc_enable_dns_hostnames" {
  description = "enable dns hostnames"
  type = bool
  # default = true
}