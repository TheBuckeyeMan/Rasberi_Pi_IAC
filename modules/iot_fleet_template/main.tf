#iot_fleet_template Module


#Create the Template for the IoT Fleet
#On trigger, the IoT Fleet will issue a new certificate as well as make a new "Thing" in aws
resource "aws_iot_provisioning_template" "pi_side_smart_home_iot_cert_tmp"{
    name = "pi_side_smart_home_iot_cert_tmp"
    description = "Template for Raspbery pi devices to obtain an access certificate, and create a digital Thing for it in aws"

    provisioning_role_arn = data.aws_iam_role.pi_side_iot_cert_issuer_role.arn

    template_body = jsonencode({
        Parameters = {
            SerialNumber = { Type = "String"}
            CertificateId = { Type = "String" }
        },
        Resources = {
            certificate = {
                Type = "AWS::IoT::Certificate", #Makes the Certificate
                Properties = {
                    CertificateId = { Ref = "CertificateId" }
                    Status = "ACTIVE"
                }
            },
            thing = {
                Type = "AWS::IoT::Thing", #Makes the "Thing"
                Properties = {
                    ThingName = { "Ref": "SerialNumber" }
                    AttributePayload = {
                        attributes = {
                            device_type = "raspberry_pi"
                        }
                    }
                }
            },
            policy = {
                Type = "AWS::IoT::Policy"
                Properties = {
                    PolicyName = "pi_side_iot_cert_issuer_role"
                }
            }
        }
    })

    tags = {
        Name = "pi_side_smart_home_iot_cert_tmp"
    }

}