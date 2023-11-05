terraform {
  backend "s3" {
    bucket = "bucket-fiap-soat1-grupo56-remote-state"
    key    = "fasteats/terraform.tfstate"
    region = "us-east-1"
  }
}