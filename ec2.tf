resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id      =  module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.securitygrb1.id]
  key_name = aws_key_pair.deployer.key_name
  tags = {
      Name = "bastion"
  }

  provisioner "local-exec" {
    command = "echo bastion server ip is ${self.aws_key_pair.deployer} "
  }
}

resource "aws_instance" "application" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id      = module.iti.public2_id
  vpc_security_group_ids = [aws_security_group.securitygrb2.id]
  key_name = aws_key_pair.deployer.key_name
  tags = {
      Name = "application"
  }
}