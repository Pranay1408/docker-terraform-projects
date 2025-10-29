provider "aws" {
  region = "ap-south-1"   
}

resource "aws_key_pair" "docker_key" {
  key_name   = "docker_key"
  public_key = file("~/.ssh/docker_key.pub")
}

resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_instance" {
  ami                    = "ami-07382eaff1a1e39da"  
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.docker_key.key_name
  vpc_security_group_ids = [aws_security_group.docker_sg.id]

  tags = {
    Name = "Docker-Training-Instance"
  }
}

output "instance_ip" {
  value = aws_instance.docker_instance.public_ip
}
