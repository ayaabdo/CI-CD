resource "aws_db_instance" "my-rds" {
  engine               = var.db_engine
  engine_version       = var.db_engine
  instance_class       = var.ins_class
  name                 = var.db_name
  port                 = "3306"
  vpc_security_group_ids = [aws_security_group.securitygrb2.id]
  db_subnet_group_name        = aws_db_subnet_group.my-db-rds.id
}

resource "aws_db_subnet_group" "my-db-rds" {
    name        = "rds-main"
    subnet_ids  = [module.iti.private1_id]
}