data "aws_ecr_image" "pi_side_smart_home_task_2_lambda" {
    repository_name = "smart-home"
    image_tag       = "pi_side_smart_home_task_2_lambda"
}

data "aws_iam_role" "pi_side_lambda_task_2_role" {
  name = "pi_side_lambda_task_2_role" #Name of the iam role that gives your lambda permissions
}
