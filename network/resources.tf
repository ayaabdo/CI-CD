resource "aws_vpc" "iti"{
    cidr_block = var.cidr
    enable_dns_support = true

    tags = {
        name = var.name
    }
}

