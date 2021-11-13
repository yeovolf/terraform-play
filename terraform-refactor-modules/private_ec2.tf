module "ec2-instance2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.4.0"
  
  name     = "private_ec2"
  count         = var.instance_count

  ami                    = data.aws_ami.amazon_linux_2.id     
  instance_type          = var.instance_type_map["qa"] 
  key_name               = var.instance_key_pair       
  vpc_security_group_ids = [module.private_EC2_sg.security_group_id]

  subnet_id              = element(module.vpc.private_subnets, count.index)
  user_data              = file("install-apache.sh")
   
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}