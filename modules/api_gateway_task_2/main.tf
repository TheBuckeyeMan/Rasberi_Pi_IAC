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
resource "aws_api_gateway_stage" "prod"{
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
    stage_name = "prod"
    deployment_id = aws_api_gateway_deployment.pi_side_smart_home_task_2_api_gateway_deployment.id

    tags = {
        Name = "DeviceRegistrationStageTask2"
    }
}
