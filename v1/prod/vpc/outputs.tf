# Output para obtener el ID de la VPC y asi referenciarla con remote_state en la subnet

output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.main.id
}