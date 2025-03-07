#api_gateway_task_1_lambda_integration_module, main.tf 

#This resoure is what allows api gateway to trigger the lambda function
resource "aws_apigatewayv2_integration" "pi_side_smart_home_api_gateway_task_1_lambda_integration"{
    api_id = aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.id
    integration_type = "AWS_PROXY"
    integration_uri = var.task_1_lambda_arn
}



#Allow API Gateway to Invoke Lambda
resource "aws_lambda_permission" "pi_side_smart_home_api_gateway_task_1_lambda_permission"{
    statement_id = "AllowAPIGatewayInvoke"
    action = "lambda:InvokeFunction"
    function_name = var.task_1_lambda_arn
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.pi_side_smart_home_task_1_api_gateway.execution_arn}/*"
}
