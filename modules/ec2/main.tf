resource "aws_security_group" "ssh" {
  name        = "${var.name_prefix}-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}
