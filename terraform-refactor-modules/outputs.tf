output "vpc" {
  description = "VPC id"
  value       = module.vpc.vpc_id

}

output "bastion_sg" {
  description = "security group id"
  value       = module.bastion_sg.security_group_id

}

output "Private_sg" {
  description = "security group id"
  value       = module.private_EC2_sg.security_group_id

}