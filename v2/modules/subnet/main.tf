# La vpc_id la obtenemos de el bloque data desde el archivo outputs y el nombre del bloque del output, en este caso vpc_id
resource "aws_subnet" "private" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr_block

    tags = {
      Name = "${var.env}-private"
    }
}

# Testear si el output devuelve el id de la VPC en la otra carpeta
output "test" {
  value = data.terraform_remote_state.vpc
}