aws_region = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zone = ["us-east-1a","us-east-1b"]  
vpc_name = "Diligent-vpc"
vpc_pub_sub_cidr_block = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_priv_sub_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]
instance_type_map = {
    "dev" = "t3.micro" 
    "qa" = "t2.micro" 
    "prod" = "t2.small"
  }
instance_key_pair = "Public_Subnet_EC2"
vpc_database_subnets_cidr = ["10.0.21.0/24", "10.0.22.0/24"]
instance_count = "2"
instance_tags = ["private-1", "Pravate-2"]
ingress_cidr_blocks = [ "10.0.0.0/16" ]
vpc_create_database_subnet_route_table = true
vpc_create_database_subnet_group = true
vpc_enable_nat_gateway = true
vpc_enable_single_nat_gateway = true
vpc_enable_single_nat_gateway_per_az = true
vpc_enable_dns_support = true
vpc_enable_dns_hostnames = true
