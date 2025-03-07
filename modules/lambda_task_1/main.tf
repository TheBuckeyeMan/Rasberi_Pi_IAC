#lambda_task_1 module

resource "aws_lambda_function" "pi_side_smart_home_task_1_lambda" {
  function_name = "pi_side_smart_home_task_1_lambda"
  role          = data.aws_iam_role.pi_side_lambda_task_1_role.arn

  package_type = "Image"
  image_uri    = "${data.aws_ecr_image.pi_side_smart_home_task_1_lambda.image_uri}"

  environment {
    variables = {
      SERIAL_NUMBER_DYNAMO_DB = var.SERIAL_NUMBER_DYNAMO_DB
    }
  }

  timeout = 900 #Adjust the timeout of the function IN SECONDS
  memory_size = 512 #Adjust the Memory of the function

  #Ensure Lambda has permission to be triggered by API Gateway
  depends_on = [aws_apigatewayv2_integration.lambda_integration]
} 


#------Make Lambda a Event Driven Via API Gateway----------



