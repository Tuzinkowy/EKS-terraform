output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "aws_subnet_public" {
    value       = aws_subnet.public
}

output "aws_subnet_private" {
    value       = aws_subnet.private
}