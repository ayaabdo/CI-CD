resource "aws_db_instance" "my_rds" {
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "8.0.20"
  instance_class      = "db.t2.micro"
  name                = "mydb"
 
  username             = "admin"
  password             = "admin123"
  port                 = "3306" 
  skip_final_snapshot = true
  multi_az            = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_rds.name
}



resource "aws_db_subnet_group" "my_db_rds" {
    name        = "rds-main"
    subnet_ids  = [module.iti.private1_id, module.iti.private2_id]
}
