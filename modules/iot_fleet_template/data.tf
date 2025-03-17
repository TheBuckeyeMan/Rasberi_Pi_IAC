#iot_fleet_template Module
data "aws_iam_role" "pi_side_iot_cert_issuer_role"{
    name = "pi_side_iot_cert_issuer_role"
}