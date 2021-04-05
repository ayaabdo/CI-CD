resource "aws_elasticache_cluster" "els-cache" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  port                 = 6379
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "my-el-cache"
  subnet_ids = [module.iti.private1_id,module.iti.private2_id]
}