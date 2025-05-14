output "vpc_id" {
  value = aws_vpc.test.id
}

output "public_sn_id" {
  value = aws_subnet.public_sn.id
}