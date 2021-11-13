module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"
  

  name        = "bastion_security_group"
  description = "security group for bastion instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = var.ingress_cidr_blocks
    ingress_with_cidr_blocks = [
      {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = var.vpc_cidr_block
    },
  ]
  
 }