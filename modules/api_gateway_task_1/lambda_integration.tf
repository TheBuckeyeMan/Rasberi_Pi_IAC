#api_gateway_task_1_module, lambda_integration.tf 

//Api Gateway Lambda Integration
resource "aws_api_gateway_integration" "pi_side_smart_home_task_1_lambda_integration"{
    rest_api_id = aws_api_gateway_rest_api.pi_side_smart_home_task_1_api_gateway.id
    resource_id = aws_api_gateway_resource.pi_side_smart_home_task_1_register_endpoint.id
    http_method = aws_api_gateway_method.pi_side_smart_home_register_device_post.http_method
    integration_http_method = "POST"
    type = "AWS_PROXY"
    uri = data.aws_lambda_function.pi_side_smart_home_task_1_lambda.invoke_arn
}

# #This resoure is what allows api gateway to trigger the lambda function
# resource "aws_apigatewayv2_integration" "pi_side_smart_home_api_gateway_task_1_lambda_integration"{
#     api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
#     integration_type = "AWS_PROXY"
#     integration_uri = var.task_1_lambda_arn
# }



# #Allow API Gateway to Invoke Lambda
# resource "aws_lambda_permission" "pi_side_smart_home_api_gateway_task_1_lambda_permission"{
#     statement_id = "AllowAPIGatewayInvoke"
#     action = "lambda:InvokeFunction"
#     function_name = var.task_1_lambda_arn
#     principal = "apigateway.amazonaws.com"
#     source_arn = "${aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.execution_arn}/*"
# }