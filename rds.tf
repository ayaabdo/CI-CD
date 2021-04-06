resource "aws_db_instance" "my_rds" {
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "mydb"
  parameter_group_name = "default.mysql5.7"
  username = "admin"
  password = "admin123"
  port = "3306" 
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