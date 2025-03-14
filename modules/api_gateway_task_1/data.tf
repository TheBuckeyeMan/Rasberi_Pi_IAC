#Get the Lambda Task 1 ARN
data "aws_lambda_function" "pi_side_smart_home_task_1_lambda"{
    function_name = "pi_side_smart_home_task_1_lambda"
}