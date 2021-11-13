variable "aws_region" {
  description = "region value"
  type = string
  
}

variable "vpc_cidr_block" {
  description = "vpc network id"
  type = string
  
}

variable "vpc_availability_zone" {
  description = "list of availability zone for my subnets"
  type = list(string)
   
}
variable "vpc_name" {
  description = "vpc name"
  type = string
  
  
}

  
variable "vpc_pub_sub_cidr_block" {
  description = "creating a variable to hold a cidr_block of my public subnet on my account"
  type = list(string)
  
}

variable "vpc_priv_sub_cidr_block" {
  description = "creating a variable to hold a cidr_block of my private subnet on my account"
  type = list(string)
  

}


variable "instance_type_map" {
  description = "list of aws instance type"
  type = map(string)

}



 
variable "instance_key_pair" {
  description = "instance key"
  type = string
  
}

variable "vpc_database_subnets_cidr" {
  description = "creating a variable to hold a cidr_block of database subnet on my account"
  type = list(string)
  

}

variable "instance_count" {
 
}

variable "instance_tags" {
  type = list
  
}

variable "ingress_cidr_blocks" {
  type = list(string)
  

  
}
variable "vpc_create_database_subnet_route_table" {
  description = "create vpc database subnets route table"
  type = bool
  
  
}
variable "vpc_create_database_subnet_group" {
  description = "create vpc database subnets group"
  type = bool
 
  
}
variable "vpc_enable_nat_gateway" {
  description = "enable natgw"
  type = bool
  
}

variable "vpc_enable_single_nat_gateway" {
  description = "enable natgw in 1 vpc"
  type = bool
  
}

variable "vpc_enable_single_nat_gateway_per_az" {
  description = "enable natgw per az"
  type = bool
  
}

variable "vpc_enable_dns_support" {
  description = "enable dns support"
  type = bool

}

variable "vpc_enable_dns_hostnames" {
  description = "enable dns hostnames"
  type = bool

}