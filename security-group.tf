resource "aws_security_group" "securitygrb1" {
  name        = "securitygrb1"
  vpc_id      = module.iti.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "securitygrb1"
  }
}

resource "aws_security_group" "securitygrb2" {
  name        = "securitygrb2"
  vpc_id      = module.iti.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.iti.cidr_block]
  }

  tags = {
    Name = "securitygrb2"
  }
}
