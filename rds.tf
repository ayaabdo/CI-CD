resource "aws_db_instance" "my_rds" {
  allocated_storage    = 10
  engine               = var.db_engine
  engine_version       = var.db_engine
  instance_class       = var.ins_class
  name                 = var.db_name
  port                 = 3306         
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  username = "admin"
  password = "admin"
  //vpc_security_group_ids = [aws_security_group.securitygrb2.id]
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_rds.name
}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id = module.iti.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp" 
    cidr_blocks = [module.iti.cidr_block]
  }

  egress {
     from_port = 0
     to_port   = 0
     protocol  = "-1"
     cidr_blocks  = ["0.0.0.0/0"] 
  }
}

resource "aws_db_subnet_group" "my_db_rds" {
    name        = "rds-main"
    subnet_ids  = [module.iti.private1_id, module.iti.private2_id]
}