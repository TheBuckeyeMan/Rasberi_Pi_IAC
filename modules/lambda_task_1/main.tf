#lambda_task_1 module

resource "aws_lambda_function" "api_lambda" {
  function_name = "youtube-service-5"
  role          = data.aws_iam_role.existing_lambda_role.arn

  package_type = "Image"
  image_uri    = "${data.aws_ecr_image.latest_image.image_uri}"

  environment {
    variables = {
      SERIAL_NUMBER_DYNAMO_DB = var.SERIAL_NUMBER_DYNAMO_DB
    }
  }

  timeout = 900 #Adjust the timeout of the function IN SECONDS
  memory_size = 512 #Adjust the Memory of the function

}