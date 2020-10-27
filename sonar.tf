resource "aws_instance" "myFirstInstance_sonar" {
      ami           = "ami-916f59f4"
      key_name = "myEc2June2020Key"
      instance_type = "t2.micro"
      security_groups= [ "security_sonar_group_2019"]
      tags= {
        Name = "sonar_instance"
      }
    }
 resource "aws_security_group" "security_sonar_group_2019" {
      name        = "security_sonar_group_2019"
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
