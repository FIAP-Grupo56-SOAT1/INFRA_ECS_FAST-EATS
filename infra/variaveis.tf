variable "nome_repositorio" {
  type    = string
  default = "repositorio-terraform"
}
variable "cargoIam" {
  type    = string
  default = "fasteats"
}

variable "perfil" {
  type    = string
  default = "fasteats"
}

variable "portaAplicacao" {
  type    = number
  default = 8080
}

variable "ambiente" {
  type    = string
  default = "fasteats"
}

variable "containerPort" {
  type    = number
  default = 8080
}

variable "imagemDocker" {
  type    = string
  default = "fiap56soat1/fasteats-api:latest"
}

variable "containerName" {
  type    = string
  default = "fasteats"
}
