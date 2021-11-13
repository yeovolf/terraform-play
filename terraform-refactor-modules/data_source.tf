data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*.1-x86_64-gp2"]
  }
  owners = ["amazon"]
}