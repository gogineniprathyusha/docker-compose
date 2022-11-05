terraform {
 required_providers {
     aws = {
         source = "hashicorp/aws"
         version = "~>4.0"
     }
 }
}

# Configure the AWS provider

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "elkstack" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "Devops"
  user_data = file("dockerinstall.sh")
  security_groups = [ "launch-wizard-3" ]
  tags = {
    Name = "elkstack"
}
}