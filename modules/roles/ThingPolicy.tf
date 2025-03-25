

resource "aws_iam_policy" "pi_side_smart_home_thing_policy"{
    name = "pi_side_smart_home_thing_policy"
    description = "Policy for NEW THING SET UP"

    policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "iot:Connect",
          "iot:Subscribe",
          "iot:Publish",
          "iot:Receive"
        ],
        "Resource" : "*"
      }
    ]
  })

    tags = {
        Name = "pi_side_smart_home_thing_policy"
    }
}