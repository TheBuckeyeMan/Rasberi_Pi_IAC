

resource "aws_iot_policy" "pi_side_smart_home_thing_policy"{
    name = "pi_side_smart_home_thing_policy"

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