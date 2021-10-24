output "instance-public-dns" {
  value = aws_instance.Priv-Terra-instance[*].public_dns
  
}
#white card [*] adding
output "instance-public-ip" {
  value = aws_instance.Priv-Terra-instance[*].public_ip
  
}