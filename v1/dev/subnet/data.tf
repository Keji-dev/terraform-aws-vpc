# Usamos este bloque para obtener los datos de la vpc en la otra carpeta
data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}