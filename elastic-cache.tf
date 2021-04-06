resource "aws_elasticache_cluster" "el-cache" {
  cluster_id           = "mu-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  port                 = 6379
  security_group_ids = [aws_security_group.redis_sg.id]
  subnet_group_name = aws_elasticache_subnet_group.redis.name
}

resource "aws_security_group" "redis_sg" {
  name = "redis_sg"
  vpc_id = module.iti.vpc_id

  ingress {
    from_port = 6379
    to_port   = 6379
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

resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis-elastic-cache"
  subnet_ids = [module.iti.private1_id, module.iti.private2_id]
}
