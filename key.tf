resource "tls_private_key" "my_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "deployer" {
    key_name = "my-key"
    public_key = tls_private_key.my_key.public_key_openssh
}

resource "local_file" "private_key" {
    content     = tls_private_key.my_key.private_key_pem
    filename = "private_key.pem"
}
