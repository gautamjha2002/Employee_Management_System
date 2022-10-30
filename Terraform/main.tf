provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_instance" "jenkins" {
  ami = "ami-07651f0c4c315a529" // Ubuntu Machine
  instance_type = "t2.large"
  key_name = "implementing_devops" // key name (pem file)
  security_groups = [aws_security_group.project_sg.name]
  tags = {
    Name = "Project Infrastructure"
  }
}

resource "aws_security_group" "project_sg" {
  name = "project_sg"

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

  // opening port 8081 for App redirection
  ingress {
    from_port = 8081
    protocol  = "TCP"
    to_port   = 8081
    cidr_blocks = ["0.0.0.0/0"]

  }

  // all port open to send the request out
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}