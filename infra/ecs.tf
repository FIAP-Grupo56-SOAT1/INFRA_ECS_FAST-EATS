module "ecs" {
  source       = "terraform-aws-modules/ecs/aws"
  cluster_name = var.ambiente
  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
      }
    }
  }

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }
}


resource "aws_ecs_task_definition" "DOTNET-TEST-API" {
  family                   = "DOTNET-TEST-TASK"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions = jsonencode(
    [
      {
        "name"   = var.containerName
        "image"  = var.imagemDocker
        "cpu"    = 1024
        "memory" = 2048
        "environment" = [
          {
            "NAME" : "DB_SERVER",
            "value" : "fasteats-database.c6lkuclqp8pp.us-east-1.rds.amazonaws.com"
          },
          { "NAME" : "DB_PORT", "value" : "3306" },
          { "NAME" : "DB_NAME", "value" : "fasteatsdb" },
          { "NAME" : "DB_USER", "value" : "fiap56" },
          { "NAME" : "DB_PASSWORD", "value" : "fiapsoat1grupo56" },
          { "NAME" : "DB_ROOT_PASSWORD", "value" : "fiapsoat1grupo56" },
          {
            "NAME" : "MERCADO_PAGO_EMAIL_EMPRESA",
            "value" : "pagamento@lanchonete-fiap.com.br"
          },
          {
            "NAME" : "MERCADO_PAGO_CREDENCIAL",
            "value" : "TEST-2087963774082813-080820-ee2b9b80edbdecf3ea8453bb8c088bc7-64946408"
          },
          { "NAME" : "MERCADO_PAGO_USERID", "value" : "64946408" },
          { "NAME" : "MERCADO_PAGO_TIPO_PAGAMENTO", "value" : "pix" }
        ]
        "essential" = true
        "portMappings" = [
          {
            "containerPort" = "${var.containerPort}"
            "hostPort"      = "${var.portaAplicacao}"
          }
        ]
      }
  ])
}


resource "aws_ecs_service" "DOTNET-TEST-API" {
  name            = "DOTNET-TEST-API"
  cluster         = module.ecs.cluster_id
  task_definition = aws_ecs_task_definition.DOTNET-TEST-API.arn
  desired_count   = 3

  load_balancer {
    target_group_arn = aws_lb_target_group.alvo.arn
    container_name   = var.containerName
    container_port   = var.containerPort
  }

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.privado.id, aws_security_group.rds_sg.id]
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }
}
