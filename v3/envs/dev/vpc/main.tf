provider "aws" {
    region = var.region
}

# Llamamos al modulo vpc desde nuestro Github no olvidemos la ?ref=tag
module "vpc" {
    source = "git@github.com:Keji-dev/terraform-aws-vpc.git?ref=0.1.0"
    env = "dev"
    cidr_block = "10.0.0.0/19"
}