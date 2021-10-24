resource "aws_instance" "Terra-instance" {
  ami           = data.aws_ami.amazon-lunix-2.id
  instance_type = var.aws_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-pub-sub1.id
  vpc_security_group_ids = [aws_security_group.terra-web-sg.id]
  key_name = var.instance_key_pair
  


  
}

resource "aws_instance" "Priv-Terra-instance" {
  ami           = data.aws_ami.amazon-lunix-2.id
  instance_type = var.aws_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-priv-sub1.id
  vpc_security_group_ids = [aws_security_group.terra-web-sg.id]
  key_name = var.instance_key_pair
  
}