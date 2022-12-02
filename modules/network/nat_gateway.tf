# NAT Gateway

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project}-ngw"
  }
}