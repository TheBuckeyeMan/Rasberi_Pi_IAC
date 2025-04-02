#
#Get the Lambda Task 1 ARN
data "aws_lambda_function" "pi_side_smart_home_task_2_lambda"{
    function_name = "pi_side_smart_home_task_2_lambda"
}

#Get the universal cloudwatch role
data "aws_iam_role" "smart_home_cloudwatch_role" {
  name = "pi_side_smart_home_cloudwatch_role"
}