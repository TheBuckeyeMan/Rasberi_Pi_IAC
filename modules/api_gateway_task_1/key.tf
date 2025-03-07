#api_gateway_task_1_module key.tf

#Create the key for API Gateway
resource "aws_apigatewayv2_api_key" "pi_side_smart_home_api_key"{
    name = "pi_side_smart_home_api_key"
    description = "API Key for the task 1 API Gateway"

    tags = {
        Name = "pi_side_smart_home_api_key"
    }
}

#Attach it to the API Gateway using a useage plan
resource "aws_apigatewayv2_usage_plan" "pi_side_smart_home_api_gateway_task_1_usage_plan"{
    name = "pi_side_smart_home_api_gateway_task_1_usage_plan"
    api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
    description = "Usage Plan for the task 1 API Gateway"
    
    throttle_settings {
        rate_limit = 10
        burst_limit = 2
    }

    tags = {
        Name = "pi_side_smart_home_api_gateway_task_1_usage_plan"
    }
}


resource "aws_apigatewayv2_usage_plan_key" "pi_side_smart_home_api_gateway_task_1_key_usage"{
    usage_plan_id = aws_apigatewayv2_usage_plan.pi_side_smart_home_api_gateway_task_1_usage_plan.id
    key_id = aws_apigatewayv2_api_key.pi_side_smart_homeapi_key.id
    key_type = "API_KEY"
}