#api_gateway Module
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "region" {
    description = "Desired Region"
    type = string
    default = "us-east-2"
}

variable "SERIAL_NUMBER_DYNAMO_DB"{
    description = "The Name of the Serial Number Dynamo DB Table"
    type = string
}

variable "IOT_TEMPLATE_NAME"{
    description = "The Name of the Serial Number Dynamo DB Table"
    type = string
}
