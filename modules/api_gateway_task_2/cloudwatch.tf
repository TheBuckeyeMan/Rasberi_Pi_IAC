#All Required cloudwatch resources to write api gateway logs to cloudwatch

#Attach api gateway account to cloudwatch role
resource "aws_api_gateway_account" "smart_home_task_2_logging"{
    cloudwatch_role_arn = data.aws_iam_role.smart_home_cloudwatch_role.arn

    depends_on = [ aws_iam_role_policy.add_gateway_log_access ]
}

#We will add additional configuration to out api gateway stage to enable logging in main.tf

#Add the settings for the API Gateway Stage
resource "aws_api_gateway_method_settings" "smart_home_task_2_settings" {
  rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
  stage_name  = aws_api_gateway_stage.prod.stage_name

  method_path = "*/*"  # All methods/all resources
  settings {
    metrics_enabled      = true
    logging_level        = "INFO"
    data_trace_enabled   = true
  }
}

#Update the cloudwatch IAM Role to alow us to use this api gateway
resource "aws_iam_role_policy" "add_gateway_log_access" {
  name = "pi_gateway_access_logs"
  role = data.aws_iam_role.smart_home_cloudwatch_role.arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:us-east-2:339712758982:log-group:/aws/apigateway/pi-side-task-2:*"
    }]
  })
}


#Give it a log group
resource "aws_cloudwatch_log_group" "api_gateway_task_2_logs" {
  name              = "/aws/apigateway/pi-side-task-2"
  retention_in_days = 7
}