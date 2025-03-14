output "pi_side_smart_home_task_1_api_gateway_id"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_1_api_gateway.id
}

output "pi_side_smart_home_task_1_api_gateway_name"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_1_api_gateway.name
}

output "pi_side_smart_home_task_1_api_gateway_arn"{
    value = aws_api_gateway_rest_api.pi_side_smart_home_task_1_api_gateway.arn
}

output "pi_side_smart_home_task_1_register_endpoint_id"{
    value = aws_api_gateway_resource.pi_side_smart_home_task_1_register_endpoint.id
}

output "pi_side_smart_home_task_1_register_endpoint_api_endpoint"{
    value = aws_api_gateway_resource.pi_side_smart_home_task_1_register_endpoint.path_part
}

output "pi_side_smart_home_register_device_post_id"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.id
}

output "pi_side_smart_home_register_device_post_api_http_method"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.http_method
}

output "pi_side_smart_home_register_device_post_api_key_required"{
    value = aws_api_gateway_method.pi_side_smart_home_register_device_post.api_key_required
}

output "pi_side_smart_home_task_1_lambda_integration_id"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_1_lambda_integration.id
}

output "pi_side_smart_home_task_1_lambda_integration_http_method"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_1_lambda_integration.http_method
}

output "pi_side_smart_home_task_1_lambda_integration_LAMBDA_URI"{
    value = aws_api_gateway_integration.pi_side_smart_home_task_1_lambda_integration.uri
}

output "pi_side_smart_home_task_1_device_registration_key_id"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_device_registration_key.id
}

output "pi_side_smart_home_task_1_device_registration_key_name"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_device_registration_key.id
}

output "pi_side_smart_home_task_1_device_registration_key_arn"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_device_registration_key.arn
}

output "pi_side_smart_home_task_1_device_registration_key_value"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_device_registration_key.value
    sensitive = true
}

output "pi_side_smart_home_task_1_api_key_usage_plan_id"{
    value = aws_api_gateway_usage_plan.pi_side_smart_home_task_1_api_key_usage_plan.id
}

output "pi_side_smart_home_task_1_api_key_usage_plan_name"{
    value = aws_api_gateway_usage_plan.pi_side_smart_home_task_1_api_key_usage_plan.name
}

output "pi_side_smart_home_task_1_api_key_usage_plan_arn"{
    value = aws_api_gateway_usage_plan.pi_side_smart_home_task_1_api_key_usage_plan.arn
}

output "pi_side_smart_home_task_1_usage_plan_key_id"{
    value = aws_api_gateway_usage_plan_key.pi_side_smart_home_task_1_usage_plan_key.id
}

output "pi_side_smart_home_task_1_usage_plan_key_key_type"{
    value = aws_api_gateway_usage_plan_key.pi_side_smart_home_task_1_usage_plan_key.key_type
}

output "pi_side_smart_home_task_1_usage_plan_key_associated_usage_plan_id"{
    value = aws_api_gateway_usage_plan_key.pi_side_smart_home_task_1_usage_plan_key.usage_plan_id
}

output "pi_side_smart_home_task_1_api_gateway_deployment_id"{
    value = aws_api_gateway_deployment.pi_side_smart_home_task_1_api_gateway_deployment.id
}

output "pi_side_smart_home_task_1_api_gateway_deployment_description"{
    value = aws_api_gateway_deployment.pi_side_smart_home_task_1_api_gateway_deployment.description
}

output "pi_side_smart_home_lambda_task_1_allow_api_gateway_id"{
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.id
}

output "pi_side_smart_home_lambda_task_1_allow_api_gateway_statement_id"{
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.statement_id
}

output "pi_side_smart_home_lambda_task_1_allow_api_gateway_action"{
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.action
}

output "pi_side_smart_home_lambda_task_1_allow_api_gateway_associated_lambda_function"{
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.function_name
}

output "pi_side_smart_home_lambda_task_1_allow_api_gateway_principal"{
    value = aws_lambda_permission.pi_side_smart_home_allow_api_gateway.principal
}