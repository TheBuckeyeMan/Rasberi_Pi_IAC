
//Declare Path
resource "aws_api_gateway_resource" "pi_side_smart_home_task_2_register_endpoint"{
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
    parent_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.root_resource_id
    path_part   = "register"
}

resource "aws_api_gateway_method" "pi_side_smart_home_register_device_post" {
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
    resource_id = aws_api_gateway_resource.pi_side_smart_home_task_2_register_endpoint.id
    http_method = "POST"
    authorization = "NONE"
    api_key_required = false
}

