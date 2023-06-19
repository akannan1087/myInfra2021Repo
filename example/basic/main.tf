terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

provider "aws" {
  region = "us-east-1"
}

module "instance" {
    source = "../../"
  
      security_group = "jenkins-sg"
      key_name = "dashing"
      tags= {
          Name = "terratest"
  }

}
# resource "aws_vpc" "main" {
#   cidr_block = "172.16.0.0/16"
#   instance_tenancy = "default"
#   tags = {
#     Name = "main"
#   }
# }

# #Create security group with firewall rules
# resource "aws_security_group" "jenkins-sg-2022" {
#   name        = var.security_group
#   description = "security group for Ec2 instance"

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#  ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#  # outbound from jenkis server
#   egress {
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags= {
#     Name = var.security_group

#   }
# }

# resource "aws_instance" "myFirstInstance" {
#   ami           = var.ami_id
#   key_name = var.key_name
#   instance_type = var.instance_type
#   vpc_security_group_ids = [aws_security_group.jenkins-sg-2022.id]
#   tags= {
#     Name = var.tag_name
#   }
# }

# # Create Elastic IP address
# resource "aws_eip" "myFirstInstance" {
#   vpc      = true
#   instance = aws_instance.myFirstInstance.id
# tags= {
#     Name = "my_elastic_ip"
#   }
# }
