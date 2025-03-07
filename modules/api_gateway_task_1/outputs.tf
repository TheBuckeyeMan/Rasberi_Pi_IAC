output "api_key_for_task_1_sensitive"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_api_key.value
    sensitive = true
}

output "api_key_for_task_1_value_not_sensitive"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_api_key.value
    sensitive = false
}

output "api_key_for_task_1_value_no_config"{
    value = aws_api_gateway_api_key.pi_side_smart_home_task_1_api_key.value
}