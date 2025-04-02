output "task_2_lambda_arn"{
    value = data.aws_lambda_function.pi_side_smart_home_task_2_lambda.arn
}

output "pi_side_smart_home_task_2_api_gateway_id"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.id
}

output "pi_side_smart_home_task_2_api_gateway_name"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.name
}


output "pi_side_smart_home_task_2_api_gateway_arn"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_2_api_gateway.arn
}


output "pi_side_smart_home_task_2_api_gateway_deployment_id"{
    value = aws_api_gateway_deployment.pi_side_smart_home_task_2_api_gateway_deployment.id
}

output "pi_side_smart_home_api_stage_name"{
    value = aws_api_gateway_stage.prod.stage_name
}

output "pi_side_smart_home_api_id"{
    value = aws_api_gateway_stage.prod.id
}

output "pi_side_smart_home_task_2_lambda_integration_id"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration.id
}

output "pi_side_smart_home_task_2_lambda_integration_integration_method"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration.integration_http_method
}

output "pi_side_smart_home_task_2_lambda_integration_assocuated_rest_api"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration.rest_api_id
}

output "pi_side_smart_home_task_2_lambda_integration_http_meethod"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration.http_method
}

output "pi_side_smart_home_task_2_lambda_integration_uri"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_2_lambda_integration.uri
}

output "pi_side_smart_home_allow_api_gateway_id" {
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.id
}

output "pi_side_smart_home_allow_api_gateway_function_name" {
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.function_name
}

output "pi_side_smart_home_allow_api_gateway_source_arn" {
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.source_arn
}

output "pi_side_smart_home_task_2_register_endpoint_id"{
    value = aws_api_gateway_resource.pi_side_smart_home_task_2_register_endpoint.id
}

output "pi_side_smart_home_task_2_register_endpoint_path_part"{
    value = aws_api_gateway_resource.pi_side_smart_home_task_2_register_endpoint.path_part
}

output "pi_side_smart_home_task_2_register_device_post_id"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.id
}

output "pi_side_smart_home_task_2_register_device_post_http_method"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.http_method
}

output "pi_side_smart_home_task_2_register_device_post_api_key_required"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.api_key_required
}

output "smart_home_cloudwatch_role_name" {
    value = data.aws_iam_role.smart_home_cloudwatch_role.name
}

output "smart_home_cloudwatch_role_arn" {
    value = data.aws_iam_role.smart_home_cloudwatch_role.arn
}

output "smart_home_cloudwatch_role_id" {
    value = data.aws_iam_role.smart_home_cloudwatch_role.id
}

output "smart_home_api_gateway_Account_task_2_id"{
    value = aws_api_gateway_account.smart_home_task_2_logging.id
}

output "smart_home_task_2_settings_id"{
    value = aws_api_gateway_method_settings.smart_home_task_2_settings.id
}

output "api_gateway_task_2_log_path"{
    value = aws_cloudwatch_log_group.api_gateway_task_2_logs.name
}