resource "aws_dynamodb_table" "pi_side_smart_home_pi_devices_serial_numbers" {
    name = "smart_home_pi_devices_serial_numbers"
    billing_mode = "PAY_PER_REQUEST"

    attribute {
      name = "serial_number"
      type = "S"
    }

    hash_key = "serial_number"

    attribute {
        name = "device_type"
        type = "S"
    }

    attribute {
      name = "device_ip"
      type = "S"
    }

    attribute {
        name = "timestamp"
        type = "S"
    }

    tags = {
        Name = "pi_side_smart_home_pi_devices_serial_numbers"
        Environment = "Production"
    }
}