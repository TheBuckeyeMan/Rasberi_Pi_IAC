#api_gateway_task_1_module key.tf

#Create the key for API Gateway task 1
resource "aws_api_gateway_api_key" "pi_side_smart_home_task_1_device_registration_key"{
    name = "DeviceRegistrationKey"
    enabled = true

    tags = {
        Name = "DeviceRegistrationKey"
    }
}

#Create the usage plan
resource "aws_api_gateway_usage_plan" "pi_side_smart_home_task_1_api_key_usage_plan" {
    name = "DeviceRegistrationUsagePlan"
    api_stages {
      api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_1_api_gateway.id
      stage  = aws_api_gateway_stage.prod.stage_name
    }

    tags = {
        Name = "DeviceRegistrationUsagePlan"
    }
}

resource "aws_api_gateway_usage_plan_key" "pi_side_smart_home_task_1_usage_plan_key"{
    key_id = aws_api_gateway_api_key.pi_side_smart_home_task_1_device_registration_key.id
    key_type = "API_KEY"
    usage_plan_id = aws_api_gateway_usage_plan.pi_side_smart_home_task_1_api_key_usage_plan.id
}











# resource "aws_api_gateway_api_key" "pi_side_smart_home_task_1_api_key"{
#     name = "pi_side_smart_home_task_1_api_key"
#     description = "API Key for the task 1 API Gateway"
#     enabled = true

#     tags = {
#         Name = "pi_side_smart_home_task_1_api_key"
#     }
# }

# # Attach API Key to a Usage Plan
# resource "aws_api_gateway_usage_plan" "pi_side_smart_home_api_gateway_task_1_usage_plan"{
#     name = "pi_side_smart_home_api_gateway_task_1_usage_plan"
#     description = "Usage Plan for the task 1 API Gateway"
    
#     api_stages {
#         api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
#         stage = aws_apigatewayv2_stage.pi_side_smart_home_task_1_api_gateway_stage.id
#     }

#     throttle_settings {
#         rate_limit = 100
#         burst_limit = 5
#     }

#     tags = {
#         Name = "pi_side_smart_home_api_gateway_task_1_usage_plan"
#     }
# }


# #Link API Key to the Usage Plan
# resource "aws_api_gateway_usage_plan_key" "pi_side_smart_home_api_gateway_task_1_key_usage" {
#     usage_plan_id = aws_api_gateway_usage_plan.pi_side_smart_home_api_gateway_task_1_usage_plan.id
#     key_id = aws_api_gateway_api_key.pi_side_smart_home_task_1_api_key.id
#     key_type = "API_KEY"
# }