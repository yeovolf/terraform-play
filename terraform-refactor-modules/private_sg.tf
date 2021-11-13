module "private_EC2_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.4.0"
  


  name        = "SG_PRIV"
  description = "Security group for"

  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
  
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.0.0.0/16"
    },
   {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.0.0.0/16"
    }
  ]  
   
}