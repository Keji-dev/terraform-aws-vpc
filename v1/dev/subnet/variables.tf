variable "region" {
    default = "us-east-2"
}

variable "cidr_block" {
    default = "10.0.0.0/19"
}

variable "env" {
    description = "Env name"
    default = "dev"
}