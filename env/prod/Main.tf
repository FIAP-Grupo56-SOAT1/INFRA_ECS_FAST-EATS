module "prod" {
  source = "../../infra"
}

output "IP_alb" {
  value = module.prod.IP
}
