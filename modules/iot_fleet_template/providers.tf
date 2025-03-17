#iot_fleet_template Module
terraform {
  cloud {
    organization = "1220-IAC"
    workspaces {
      name = "SmartHome-PI-IOT_FLEET"
    }
  }
}
provider "aws" {
    region = var.region
    access_key  = var.aws_access_key
    secret_key  = var.aws_secret_key
}