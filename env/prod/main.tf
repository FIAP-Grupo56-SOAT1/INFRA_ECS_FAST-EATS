terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  ####### Configuring the S3 to Remote State #######
  backend "s3" {
    bucket = "bucket-fiap56-to-remote-state"
    key    = "aws-ecs-pedido/terraform.tfstate"
    region = "us-east-1"
  }
}

######## Configuring the AWS Provider ########
provider "aws" {
  region = "us-east-1" #The region where the environment
}


# Criando um modulo que utiliza os dados do infra para criação do ambiente
module "prod" {
  source                                        = "../../infra"
  containerDbName                               = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["dbname"]
  containerDbUser                               = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["username"]
  containerDbPassword                           = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["password"]
  containerDbRootPassword                       = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["password"]
  containerDbServer                             = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["host"]
  containerDbPort                               = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["port"]
  portaAplicacao                                = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["app_port"]
  url_pagamento_service                         = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["url_pagamento_service"]
  url_cozinha_service                           = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string)["url_cozinha_service"]
  AWS_SQS_QUEUE_PEDIDO_CRIADO                   = pedido-criado
  AWS_SQS_QUEUE_PEDIDO_AGUARDANDO_PAGAMENTO     = pedido-aguardando-pagamento
  AWS_SQS_QUEUE_PEDIDO_PAGO                     = pedido-pago
  AWS_SQS_QUEUE_PEDIDO_RECEBIDO                 = pedido-recebido
  AWS_SQS_QUEUE_PEDIDO_EM_PREPARO               = pedido-em-preparo
  AWS_SQS_QUEUE_PEDIDO_PRONTO                   = pedido-pronto
  AWS_SQS_QUEUE_PEDIDO_FINALIZADO               = pedido-finalizado
  AWS_SQS_QUEUE_PEDIDO_CANCELADO                = pedido-cancelado
  AWS_SQS_QUEUE_COZINHA_ERRO_PEDIDO_RECEBIDO    = cozinha-erro-pedido-recebido
  AWS_SQS_QUEUE_COZINHA_ERRO_PEDIDO_EM_PREPARO  = cozinha-erro-pedido-em-preparo
  AWS_SQS_QUEUE_COZINHA_ERRO_PEDIDO_PRONTO      = cozinha-erro-pedido-pronto
  AWS_SQS_QUEUE_COZINHA_ERRO_PEDIDO_FINALIZADO  = cozinha-erro-pedido-finalizado
  AWS_SQS_QUEUE_PAGAMENTO_ERRO_PEDIDO_CANCELAR  = pagamento-erro-pedido-cancelar
  AWS_SQS_QUEUE_PAGAMENTO_RECEBER_PEDIDO_PAGO   = pagamento-receber-pedido-pago
  AWS_SQS_QUEUE_PAGAMENTO_GERAR_PAGAMENTO       = pagamento-gerar-pagamento
  AWS_SQS_QUEUE_PAGAMENTO_ERRO_PAGAMENTO_PEDIDO = pagamento-erro-pagamento-pedido
}


#obteando dados do secret manager
data "aws_secretsmanager_secret" "secrets_microservico" {
  name = "prod/soat1grupo56/Pedido"
}

data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = data.aws_secretsmanager_secret.secrets_microservico.id
}


output "IP_alb" {
  value = module.prod.app_url
}


