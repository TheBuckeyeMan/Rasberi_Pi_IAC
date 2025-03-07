resource "aws_iam_role" "pi_side_static_api_key_role"{
    name = "pi_side_key_role"
    description = "API Key Role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Effect = "Allow"
        Principal = { Service = "apigateway.amazonaws.com" }
        Action = "sts:AssumeRole"
        }]
    })

  tags = {
    Name = "pi_side_key_role"
  }
}

resource "aws_iam_policy" "pi_side_static_api_key_policy"{
    name = "pi_side_static_api_key_policy"
    description = "Enforces API Gateway to use API keys"

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["execute-api:Invoke"]
      Resource = "*" # Restrict to API Gateway ARN
    #   Condition = {
    #     "StringEquals" = {
    #       "aws:SourceIp" = "YOUR_WHITELISTED_IP" # Restrict access further if needed
    #     }
    #   }
    }]
  })

    tags = {
        Name = "pi_side_static_api_key_policy"
    }
}

resource "aws_iam_role_policy_attachment" "pi_side_static_api_key_policy_attachment" {
    role = aws_iam_role.pi_side_static_api_key_role.name
    policy_arn = aws_iam_policy.pi_side_static_api_key_policy.arn
}