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
  type    = string
  default = "fasteats-database.c6lkuclqp8pp.us-east-1.rds.amazonaws.com"
}

variable "containerDbPort" {
  type    = string
  default = "3306"
}

variable "containerDbName" {
  type    = string
  default = "fasteatsdb"
}

variable "containerDbUser" {
  type    = string
  default = "fiap56"
}

variable "containerDbPassword" {
  type    = string
  default = "fiapsoat1grupo56"
}


variable "containerDbRootPassword" {
  type    = string
  default = "fiapsoat1grupo56"
}


variable "containerMercadoPagoEmailEmpresa" {
  type    = string
  default = "pagamento@lanchonete-fiap.com.br"
}


variable "containerMercadoPagoCredential" {
  type    = string
  default = "TEST-2087963774082813-080820-ee2b9b80edbdecf3ea8453bb8c088bc7-64946408"
}


variable "containerMercadoPagoUderId" {
  type    = string
  default = "64946408"
}


variable "containerMercadoPagoTipoPagamento" {
  type    = string
  default = "pix"
}
