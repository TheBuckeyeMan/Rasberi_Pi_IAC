resource "aws_iam_role" "smart_home_pi_side_api_gateway_role"{
    name = "smart_home_pi_side_api_gateway_role"
    description = "API Gateway "

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Effect = "Allow"
        Principal = { Service = "apigateway.amazonaws.com" }
        Action = "sts:AssumeRole"
        }]
    })

  tags = {
    Name = "smart_home_pi_side_api_gateway_role"
  }
}


resource "aws_iam_policy" "smart_home_pi_side_api_gateway_policy"{
    name = "smart_home_pi_side_api_gateway_policy"
    description = "Allows API Gateway to invoke Lambda functions"

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["lambda:InvokeFunction"]
      Resource = "*" # Replace with actual Lambda ARNs once deployed
    }]
  })

  tags = {
    Name = "smart_home_pi_side_api_gateway_policy"
  }
}

resource "aws_iam_role_policy_attachment" "smart_home_pi_side_api_gateway_policy_attachment" {
    role = aws_iam_role.smart_home_pi_side_api_gateway_role.name
    policy_arn = aws_iam_policy.smart_home_pi_side_api_gateway_policy.arn
}