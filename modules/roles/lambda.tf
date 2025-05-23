#Role for Task 1 Lambda
resource "aws_iam_role" "pi_side_lambda_task_1_role" {
    name = "pi_side_lambda_task_1_role"
    
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "pi_side_lambda_task_1_role"
  }
}

resource "aws_iam_policy" "pi_side_lambda_task_1_policy"{
    name = "pi_side_lambda_task_policy"
    description = "Allows Lambda to write Serial Numbers to DynamoDB"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect   = "Allow"
            Action   = [
                "dynamodb:PutItem",
                "dynamodb:GetItem", 
                "dynamodb:Scan",    
                "dynamodb:Query"  
            ]
            Resource = "arn:aws:dynamodb:us-east-2:339712758982:table/smart_home_pi_devices_serial_numbers"
        },
        {
            Effect = "Allow"
            Action = [
                "ecr:GetAuthorizationToken"
            ]
            Resource = "*"
        },
        {
            Effect = "Allow"
            Action = [
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage"
            ]
            Resource = "arn:aws:ecr:us-east-2:339712758982:repository/smart-home"
        },
        {
            Effect = "Allow"
            Action = [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
            Resource = "arn:aws:logs:us-east-2:339712758982:*"
        }
        ]
    })

    tags = {
        Name = "pi_side_lambda_task_policy"
    }
}

resource "aws_iam_role_policy_attachment" "pi_side_lambda_task_1_policy_attachment" {
    role = aws_iam_role.pi_side_lambda_task_1_role.name
    policy_arn = aws_iam_policy.pi_side_lambda_task_1_policy.arn
}


//Role for Task 2 Lambda - Completed
resource "aws_iam_role" "pi_side_lambda_task_2_role" {
    name = "pi_side_lambda_task_2_role"
    
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Effect = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action = "sts:AssumeRole"
        }]
    })

  tags = {
    Name = "pi_side_lambda_task_2_role"
  }
}

resource "aws_iam_policy" "pi_side_lambda_task_2_policy" {
  name        = "pi_side_lambda_task_2_policy"
  description = "Allows Lambda to read from DynamoDB, interact with IoT Core, and generate certificates"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "execute-api:Invoke"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Resource = "arn:aws:ecr:us-east-2:339712758982:repository/smart-home"
      },
      {
        Effect   = "Allow"
        Action   = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = "arn:aws:dynamodb:us-east-2:339712758982:table/smart_home_pi_devices_serial_numbers"
      },
      {
        Effect   = "Allow"
        Action   = [
          "iot:DescribeProvisioningTemplate",
          "iot:CreateProvisioningClaim",
          "iot:ListProvisioningTemplates",
          "iot:CreateThing",
          "iot:CreateKeysAndCertificate",
          "iot:AttachThingPrincipal",
          "iot:AttachPolicy",
          "iot:UpdateCertificate",
          "iot:DescribeCertificate",
          "iot:DescribeEndpoint",
          "iot:DescribeThing"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:us-east-2:339712758982:*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "pi_side_lambda_task_2_policy_attachment" {
    role = aws_iam_role.pi_side_lambda_task_2_role.name
    policy_arn = aws_iam_policy.pi_side_lambda_task_2_policy.arn
}