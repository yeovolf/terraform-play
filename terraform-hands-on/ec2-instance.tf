resource "aws_instance" "Terra-instance" {
  ami           = data.aws_ami.amazon-lunix-2.id
  instance_type = var.instance_type_list[1]
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-pub-sub1.id
  vpc_security_group_ids = [aws_security_group.terra-web-sg.id]
  key_name = var.instance_key_pair
  count = 2
  tags = {
    "name" = "Helloworld-${var.instance_name}-${count.index}"
  }
  


  
}

resource "aws_instance" "Priv-Terra-instance" {
  ami           = data.aws_ami.amazon-lunix-2.id
  instance_type = var. instance_type_map["prod"]
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-priv-sub1.id
  vpc_security_group_ids = [aws_security_group.terra-web-sg.id]
  key_name = var.instance_key_pair
  count = 2
  tags = {
    "name" = "Helloworld-${var.instance_name}-${count.index}"
  }
  
  
  
}


