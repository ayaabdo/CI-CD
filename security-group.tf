resource "aws_security_group" "securitygrb1" {
  name        = "securitygrb1"
  vpc_id      = module.iti.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [ "0.0.0.0/0"]
  } 

  tags = {
    Name = "securitygrb2"
  }
}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id = module.iti.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp" 
    cidr_blocks = [var.cidr]
  }

  egress {
     from_port = 0
     to_port   = 0
     protocol  = "-1"
     cidr_blocks  = ["0.0.0.0/0"] 
  }
}

resource "aws_security_group" "redis_sg" {
  name = "redis_sg"
  vpc_id = module.iti.vpc_id

  ingress {
    from_port = 6379
    to_port   = 6379
    protocol  = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
     from_port = 0
     to_port   = 0
     protocol  = "-1"
     cidr_blocks  = ["0.0.0.0/0"] 
  }
}
