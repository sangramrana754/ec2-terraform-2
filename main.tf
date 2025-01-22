# main.tf
provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "my_ec2" {
  ami           = "ami-0fd05997b4dff7aac" # Update with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "srana"    # Update with your EC2 key pair
  subnet_id     = "subnet-098b4c66e13e11f87" # Update with your subnet ID

  tags = {
    Name = "MyEC2GitHub-4"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
}

output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}


