provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "jenkins" {
  ami = "ami-0e6837d3d816a2ac6" // centos 8 machine ami
  instance_type = "t2.micro"
  key_name = "jenkins"
  security_groups = [aws_security_group.jenkins_sg.name]
  tags = {
    Name = "Jenkins"
  }
}

resource "aws_instance" "Ansible-admin" {
  ami = "ami-076e3a557efe1aa9c" // Amazon machine
  instance_type = "t2.micro"
  tags = {
    Name = "Ansible_Admin"
  }
}


resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_sg"

  // opening port 8080 to access jenkins server
  ingress {
    from_port = 8080
    protocol  = "TCP"
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]

  }
  // opening port 22 to get inside the OS with SSH
  ingress {
    from_port = 22
    to_port   = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}