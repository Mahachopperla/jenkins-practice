resource "aws_instance" "roboshop_jenkins_server" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]
  # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("jenkins_installation.sh")

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "roboshop_jenkins_agent" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]
  # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("jenkins-agent.sh")

  tags = {
    Name = "jenkins-agent"
  }
}


resource "aws_security_group" "allow_all_ip" {
  name        = "allow_all_ip"
  description = "Allow all inbound traffic and all outbound traffic"
 
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_all_ip"
  }
}

