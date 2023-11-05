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
  default = "389812301415.dkr.ecr.us-east-1.amazonaws.com/fiap56-repository:latest"
}

variable "containerName" {
  type    = string
  default = "fasteats"
}

variable "aws_access_key" {
  type    = string
  default = "AKIAVVQU7VZTWI25RZPA"
}

variable "aws_secret_key" {
  type    = string
  default = "e59BpZZBu7qd+iB/N4ZHgjjBdsCHzBfIcD3Tp7X9"
}
