module "ec2-instance_2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.2.0"
  # insert the 5 required variables here
  name           = "bastion_host"
  
  ami                    = data.aws_ami.amazon_linux_2.id    
  instance_type          = var.instance_type_map["qa"] 
  key_name               = var.instance_key_pair                
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[1] 

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
