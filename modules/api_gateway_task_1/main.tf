#api_gateway_task_1_module main.tf
#Define the API Gateway Itself
resource "aws_apigatewayv2_api" "pi_side_smart_home_task_1_api_gateway"{
    name = "pi_side_smart_home_task_1_api_gateway"
    protocol_type = "HTTP"
    description = "API Gateway Resource for the First task to save serial numbers to the database"

    tags = {
        Name = "pi_side_smart_home_task_1_api_gateway"
        Environment = "Production"
    }
}

#Define an API Gateway Stage
resource "aws_apigatewayv2_stage" "pi_side_smart_home_task_1_api_gateway_stage"{
    api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
    name = "prod"
    auto_deploy = true
    description = "This API Gateway Stage enables automatic deployment for API Gateway Changes"

    tags = {
        Name = "pi_side_smart_home_task_1_api_gateway_stage"
    }
}


#Define the API Gateway ROUTE
resource "aws_apigatewayv2_route" "pi_side_smart_home_api_gateway_task_1_register_route"{
    api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
    route_key = "POST /register"
    target = "integrations/${aws_apigatewayv2_integration.pi_side_smart_home_api_gateway_task_1_lambda_integration.id}"  #Target the lambda function to be triggered
    api_key_required = true
}





