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

variable "task_1_lambda_arn" {
    description = "The arn of the lambda function"
    type = string
    default = "arn:aws:lambda:us-east-2:339712758982:function:pi_side_smart_home_task_1_lambda"
}