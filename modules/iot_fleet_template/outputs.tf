#iot_fleet_template Module

output "pi_side_smart_home_iot_cert_tmp_id"{
    value = aws_iot_provisioning_template.pi_side_smart_home_iot_cert_tmp.id
}

output "pi_side_smart_home_iot_cert_tmp_name"{
    value = aws_iot_provisioning_template.pi_side_smart_home_iot_cert_tmp.name
}

output "pi_side_smart_home_iot_cert_tmp_arn"{
    value = aws_iot_provisioning_template.pi_side_smart_home_iot_cert_tmp.arn
}

output "pi_side_smart_home_iot_cert_tmp_description"{
    value = aws_iot_provisioning_template.pi_side_smart_home_iot_cert_tmp.description
}