#IAM Role for the IoT Fleet Template and Rasberry Pi Devices themselves
resource "aws_iam_role" "pi_side_iot_cert_issuer_role"{
  name = "pi_side_iot_cert_issuer_role"
  description = "Thie role will give the IoT Template a role to associate with issued certificates granting the certificates access to the required IoT Topics"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "iot.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "pi_side_iot_cert_issuer_role"
  }
}

resource "aws_iam_policy" "pi_side_iot_cert_issuer_policy"{
  name = "pi_side_iot_cert_issuer_policy"
  description = "Allows the IoT Template to attach policies to certificates"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "iot:CreateThing",
          "iot:RegisterThing",
          "iot:CreateKeysAndCertificate",
          "iot:CreateCertificateFromCsr",
          "iot:AttachThingPrincipal",
          "iot:AttachPolicy",
          "iot:DescribeProvisioningTemplate",
          "iot:ListProvisioningTemplates",
          "iot:CreateProvisioningClaim"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "pi_side_iot_cert_issuer_policy"
  }
}

resource "aws_iam_role_policy_attachment" "pi_side_iot_cert_issuer_policy_attachment" {
  role = aws_iam_role.pi_side_iot_cert_issuer_role.name
  policy_arn = aws_iam_policy.pi_side_iot_cert_issuer_policy.arn
}

