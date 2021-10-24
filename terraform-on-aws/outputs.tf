output "instance-public-dns" {
  value = aws_instance.Priv-Terra-instance.public_dns
  
}
output "instance-public-ip" {
  value = aws_instance.Priv-Terra-instance.public_ip
  
}