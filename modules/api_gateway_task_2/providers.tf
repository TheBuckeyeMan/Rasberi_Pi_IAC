#api_gateway Module
terraform {
  cloud {
    organization = "1220-IAC"
    workspaces {
      name = "SmartHome-PI-API_GATEWAY_TASK_2"
    }
  }
}
provider "aws" {
    region = var.region
    access_key  = var.aws_access_key
    secret_key  = var.aws_secret_key
}