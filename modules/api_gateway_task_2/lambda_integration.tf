

//Api Gateway Lambda Integration
resource "aws_api_gateway_integration" "pi_side_smart_home_task_2_lambda_integration"{
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
    resource_id = aws_api_gateway_resource.pi_side_smart_home_task_2_register_endpoint.id
    http_method = aws_api_gateway_method.pi_side_smart_home_register_device_post.http_method
    integration_http_method = "POST"
    type = "AWS_PROXY"
    uri = data.aws_lambda_function.pi_side_smart_home_task_2_lambda.invoke_arn
}

#------Allow API Gateway to invoke lambda----------
resource "aws_lambda_permission" "pi_side_smart_home_allow_api_gateway" {
    statement_id  = "AllowExecutionFromAPIGateway_task_2"
    action        = "lambda:InvokeFunction"
    function_name = data.aws_lambda_function.pi_side_smart_home_task_2_lambda.function_name
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.execution_arn}/*/*"
}