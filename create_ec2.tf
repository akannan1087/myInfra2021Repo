 resource "aws_instance" "myFirstInstance" {
  ami           = "ami-0e82959d4ed12de3f"
  count=1
  key_name = "myEc2KeyOct"
  instance_type = "t2.small"
  security_groups= [ "security_grp_8080"]
  tags= {
    Name = "ec2_instance"
  }
}

resource "aws_security_group" "security_grp_8080" {
  name        = "security_grp_8080"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_grp_8080"
  }
}

