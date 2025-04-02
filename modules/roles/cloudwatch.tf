#Cloudwatch.tf can serve as the cloudwatch roles for ALL CLOUDWATCH RESOURCES

resource "aws_iam_role" "smart_home_cloudwatch_role"{
    name = "pi_side_smart_home_cloudwatch_role"
     assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "apigateway.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "pi_side_smart_home_cloudwatch_role",
  }
}

resource "aws_iam_policy" "smart_home_cloudwatch_policy"{
    name = "pi_side_smart_home_cloudwatch_policy"

    policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "smart_home_cloudwatch_role_policy_attachment" {
  role       = aws_iam_role.smart_home_cloudwatch_role.name
  policy_arn = aws_iam_policy.smart_home_cloudwatch_policy.arn
}