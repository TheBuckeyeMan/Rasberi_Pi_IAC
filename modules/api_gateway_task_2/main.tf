#api_gateway_task_1_module main.tf

#API Gateway Itself
resource "aws_api_gateway_rest_api" "pi_side_smart_home_task_2_api_gateway"{
    name = "pi_side_smart_home_task_2_api_gateway"
    description = "API Gateway Resource for the First task to save serial numbers to the database"

    tags = {
        Name = "pi_side_smart_home_task_2_api_gateway"
    }
}


//Api Gateway Deploy Resource
resource "aws_api_gateway_deployment" "pi_side_smart_home_task_2_api_gateway_deployment"{
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
    description = "This API Gateway Deployment enables automatic deployment for API Gateway Changes"
    depends_on = [aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration]

    triggers = {
      redeployment = sha1(jsonencode(aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway))
    }
}

//Add stage
resource "aws_api_gateway_stage" "prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
  deployment_id = aws_api_gateway_deployment.pi_side_smart_home_task_2_api_gateway_deployment.id

#Required we add the below for cloudwatch integration with api gateway
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gateway_task_2_logs.arn
    format = jsonencode({
      requestId      = "$context.requestId"
      ip             = "$context.identity.sourceIp"
      caller         = "$context.identity.caller"
      user           = "$context.identity.user"
      requestTime    = "$context.requestTime"
      httpMethod     = "$context.httpMethod"
      resourcePath   = "$context.resourcePath"
      status         = "$context.status"
      protocol       = "$context.protocol"
      responseLength = "$context.responseLength"
    })
  }

  tags = {
    Name = "DeviceRegistrationStageTask2"
  }
}
