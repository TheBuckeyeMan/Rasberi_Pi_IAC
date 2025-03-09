output "pi_side_smart_home_task_1_lambda_lambda_name" {
    value = aws_lambda_function.pi_side_smart_home_task_1_lambda.function_name
}

output "pi_side_smart_home_task_1_lambda_lambda_id" {
    value = aws_lambda_function.pi_side_smart_home_task_1_lambda.id
}

output "pi_side_smart_home_task_1_lambda_arn" {
    value = aws_lambda_function.pi_side_smart_home_task_1_lambda.arn
}

output "pi_side_smart_home_task_1_lambda_image_uri" {
    value = aws_lambda_function.pi_side_smart_home_task_1_lambda.image_uri
}

output "pi_side_smart_home_task_1_lambda_associated_iam_role" {
    value = aws_lambda_function.pi_side_smart_home_task_1_lambda.role
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
