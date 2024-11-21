# Obtenemos el vpc id del modulo del archivo envs/dev/vpc/main y referenciamos el output del modules/vpc que es "vpc_id"

output "vpc_id" {
    description = "VPC id"
    value = module.vpc.vpc_id
}