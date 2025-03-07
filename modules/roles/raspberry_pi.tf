#This is the IAM Role the Raspberry pi will assume and be granted temporary credentials to the aws account
resource "aws_iam_role" "pi_side_raspberry_pi_role"{
    name = "raspberry_pi_role"
    description = "This is the IAM Role the Raspberry pi will assume and be granted temporary credentials to the aws account"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Effect = "Allow"
        Principal = { Service = "iot.amazonaws.com" }
        Action = "sts:AssumeRole"
        }]
    })

  tags = {
    Name = "raspberry_pi_role"
  }
}

resource "aws_iam_policy" "pi_side_raspberry_pi_policy" {
    name = "pi_side_raspberry_pi_policy"
    description = "Allows Raspberry Pi to assume IAM role for API Gateway access"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect   = "Allow"
            Action   = ["execute-api:Invoke"]
            Resource = "*" # Restrict this to your API Gateway ARN - Add API Gateways
        },
        {
            Effect   = "Allow"
            Action   = ["sts:AssumeRole"]
            Resource = aws_iam_role.smart_home_pi_side_api_gateway_role.arn
        }
        ]
    })

  tags = {
    Name = "pi_side_raspberry_pi_policy"
  }
}

resource "aws_iam_role_policy_attachment" "pi_side_raspberry_pi_policy_attachment" {
    role = aws_iam_role.pi_side_raspberry_pi_role.name
    policy_arn = aws_iam_policy.pi_side_raspberry_pi_policy.arn
}