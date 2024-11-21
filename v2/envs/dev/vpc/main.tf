provider "aws" {
    region = var.region
}

# Llamamos al modulo vpc para que se cree una vpc con la configuracion especificada en el modulo reusable y cambiamos sus variables a nuestro gusto
module "vpc" {
    source = "../../../modules/vpc"
    env = "dev"
    cidr_block = "10.0.0.0/19"
}