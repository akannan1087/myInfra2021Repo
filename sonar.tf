resource "aws_instance" "mySonarInstance" {
      ami           = "ami-0b9064170e32bde34"

      key_name = var.key_name
      instance_type = "t2.micro"
      security_groups= [ "security_sonar_group_2022"]
      tags= {
        Name = "sonar_instance"
      }
    }

 resource "aws_security_group" "security_sonar_group_2022" {
      name        = "security_sonar_group_2022"
      description = "security group for Sonar"

      ingress {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     # outbound from Sonar server
      egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      tags= {
        Name = "security_sonar"
      }
    }

# Create Elastic IP address for Sonar instance
resource "aws_eip" "mySonarInstance" {
  vpc      = true
  instance = aws_instance.mySonarInstance.id
tags= {
    Name = "sonar_elastic_ip"
  }
}
