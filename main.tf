# main.tf
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0fd05997b4dff7aac" # Update with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "srana"    # Update with your EC2 key pair
#  security_groups = "sg-06b988bef04fb9680" # Update with your security group ID
  subnet_id     = "subnet-098b4c66e13e11f87" # Update with your subnet ID

  tags = {
    Name = "MyEC2GitHub-2"
  }
}

output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
