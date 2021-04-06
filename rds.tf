resource "aws_db_instance" "my_rds" {
  engine               = var.db_engine
  engine_version       = var.db_engine
  instance_class       = var.ins_class
  name                 = var.db_name
  //port                 = "3306"
  vpc_security_group_ids = [aws_security_group.securitygrb2.id]
  //vpc_security_group_ids = [aws_db_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_rds.name
}

resource "aws_db_security_group" "rds_sg" {
  name = "rds_sg"

  ingress {
    cidr = var.cidr
  }
}

resource "aws_db_subnet_group" "my_db_rds" {
    name        = "rds-main"
    subnet_ids  = [module.iti.private1_id]
}