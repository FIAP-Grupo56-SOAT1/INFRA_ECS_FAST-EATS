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



variable "containerName" {
  type    = string
  default = "DB_SERVER"
}

variable "imagemDocker" {
  type    = string
  default = "fiap56soat1/fasteats-api:latest"
}

variable "containerDbServer" {
  type = string
}

variable "containerDbPort" {
  type    = string
  default = "3306"
}

variable "containerDbName" {
  type = string
}

variable "containerDbUser" {
  type = string
}

variable "containerDbPassword" {
  type = string
}


variable "containerDbRootPassword" {
  type = string
}


variable "containerMercadoPagoEmailEmpresa" {
  type = string
}


variable "containerMercadoPagoCredential" {
  type = string
}


variable "containerMercadoPagoUderId" {
  type = string
}


variable "containerMercadoPagoTipoPagamento" {
  type = string
}
