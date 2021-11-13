module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  # insert the 21 required variables here
  name = "terraform-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs             = var.vpc_availability_zone
  private_subnets = var.vpc_priv_sub_cidr_block
  public_subnets  = var.vpc_pub_sub_cidr_block
  enable_nat_gateway = var.vpc_enable_nat_gateway
  # enable_vpn_gateway = true
  single_nat_gateway  = var.vpc_enable_single_nat_gateway
  
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  create_database_subnet_group           = var.vpc_create_database_subnet_group
  create_database_subnet_route_table     = var.vpc_create_database_subnet_route_table
  database_subnets    = var.vpc_database_subnets_cidr
  
  database_subnet_tags = {
    Type = "database-subnets"
  }

  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  tags = {
    Owner = "soho_yeo"
    Environment = "SRE"
  }
  
}