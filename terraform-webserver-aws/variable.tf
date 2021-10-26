variable "vpc_cir_block" {
  description = "vpc network id"
  type = string
  default = "10.0.0.0/16"
  
}
variable "aws_region" {
  description = "region value"
  type = string
  default = "us-east-1"
  
}
variable "pub_sub1_cidr_block" {
  description = "vpc network id"
  type = string
  default = "10.0.0.0/24"
  
}
variable "priv_sub1_cidr_block" {
  description = "vpc network id"
  type = string
  default = "10.0.1.0/24"
  
}
variable "aws_instance_type" {
  description = "instance type"
  type = string
  default = "t2.micro"
  
}
variable "instance_key_pair" {
  description = "instance key"
  type = string
  default = "Public_Subnet_EC2"
  
}
# variable list
variable "instance_type_list" {
  description = "list of aws instance type"
  type = list(string)
  default = ["t3.micro", "t2.micro", "t2.small"]
  
}
# variable map
variable "instance_type_map" {
  description = "list of aws instance type"
  type = map(string)
  default = {
    "dev" = "t3.micro" 
    "qa" = "t2.micro" 
    "prod" = "t2.small"
  }
}

# string interpolation
# variable "instance_name " {
#   description = "the name of each instance"
#   type = string
#   default = "ec2-instance"
  
# }
