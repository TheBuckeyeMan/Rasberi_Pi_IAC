resource "aws_iam_role" "pi_side_lambda_task_1_role" {
    name = "pi_side_lambda_task_role"
    
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "pi_side_lambda_task_role"
  }
}

resource "aws_iam_policy" "pi_side_lambda_task_1_policy"{
    name = "pi_side_lambda_task_policy"
    description = "Allows Lambda to write Serial Numbers to DynamoDB"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Effect   = "Allow"
        Action   = ["dynamodb:PutItem"]
        Resource = "arn:aws:dynamodb:us-east-2:339712758982:table/smart_home_pi_devices_serial_numbers"
        }]
    })

    tags = {
        Name = "pi_side_lambda_task_policy"
    }
}

resource "aws_iam_role_policy_attachment" "pi_side_lambda_task_1_policy_attachment" {
    role = aws_iam_role.pi_side_lambda_task_1_role.name
    policy_arn = aws_iam_policy.pi_side_lambda_task_1_policy.arn
}