provider
provider "aws" {
  region = var.aws_region
  # access_key ="value"
  # secret_key ="value"
}

#ami-data-source
data "aws_ami" "amazon-lunix-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

#vpc
resource "aws_vpc" "terra-vpc" {
  cidr_block = var.vpc_cir_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  
}
#public subnet 1

resource "aws_subnet" "terra-pub-sub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.pub_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-pub-sub1"
  }
}

#public subnet 2
resource "aws_subnet" "terra-pub-sub2" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.priv_sub1_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = "terra-pub-sub2"
  }
}

#Internet gateway
resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id 
}

#Route Table 

resource "aws_route_table" "my_table" {
  vpc_id = aws_vpc.terra-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-igw.id
  }

}

#associate subnet pub-sub1

resource "aws_route_table_association" "rta_terra-pub-sub1" {
  subnet_id      = aws_subnet.terra-pub-sub1.id
  route_table_id = aws_route_table.my_table.id
}
# associate subnet pub-sub2

resource "aws_route_table_association" "rta_terra-pub-sub2" {
  subnet_id      = aws_subnet.terra-pub-sub2.id
  route_table_id = aws_route_table.my_table.id
}

#security group
resource "aws_security_group" "terra-web-sg" {
  name        = "my_web_security"
  description = "Allow http,ssh,icmp"
  vpc_id      =  aws_vpc.terra-vpc.id


  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "mywebserver_sg"
  }
}

#launch configuration
resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id = data.aws_ami.amazon-lunix-2.id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = var.instance_type_list[1]
  key_name = var.instance_key_pair

  security_groups = [ aws_security_group.terra-web-sg.id ]
  associate_public_ip_address = true

  user_data = file("install-apache.sh") 

  lifecycle {
    create_before_destroy = true
  }
}

#auto scaling
resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.web.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 4
  
  health_check_type    = "ELB"
  load_balancers = [
    aws_elb.web_elb.id
  ]

  launch_configuration = aws_launch_configuration.web.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier  = [
    aws_subnet.terra-pub-sub1.id,
    aws_subnet.terra-pub-sub2.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }

}

# elastic load balancer
resource "aws_security_group" "elb_http" {
  name        = "elb_http"
  description = "Allow HTTP traffic to instances through Elastic Load Balancer"
  vpc_id = aws_vpc.terra-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP through ELB Security Group"
  }
}

resource "aws_elb" "web_elb" {
  name = "web-elb"
  security_groups = [
    aws_security_group.terra-web-sg.id
  ]
  subnets = [
    aws_subnet.terra-pub-sub1.id,
    aws_subnet.terra-pub-sub2.id
  ]

  cross_zone_load_balancing   = true

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }

}

