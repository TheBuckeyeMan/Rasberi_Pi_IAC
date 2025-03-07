resource "aws_iam_role" "smart_home_pi_side_dymano_db_access_role" {
    name = "smart_home_dymano_db_access_role"
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Effect = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action = "sts:AssumeRole"
        }]
    })

  tags = {
    Name = "smart_home_dymano_db_access_role"
  }
}

resource "aws_iam_policy" "smart_home_pi_side_dynamo_db_access_policy"{
    name = "smart_home_dynamo_db_access_policy"
    description = "Allows lambda to read/write to the Dynamo DB"

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["dynamodb:PutItem", "dynamodb:GetItem", "dynamodb:UpdateItem", "dynamodb:Scan"]
      Resource = "arn:aws:dynamodb:us-east-2:339712758982:table/smart_home_pi_devices_serial_numbers"
    }]
  })

  tags = {
    Name = "smart_home_dynamo_db_access_policy"
  }
}

resource "aws_iam_role_policy_attachment" "smart_home_dynamo_db_access_policy_attachment" {
    role = aws_iam_role.smart_home_pi_side_dymano_db_access_role.name
    policy_arn = aws_iam_policy.smart_home_pi_side_dynamo_db_access_policy.arn
}