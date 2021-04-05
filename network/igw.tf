resource "aws_internet_gateway" "iti" {
    vpc_id = aws_vpc.iti.id

    tags = {
        Name = var.name
    }
}