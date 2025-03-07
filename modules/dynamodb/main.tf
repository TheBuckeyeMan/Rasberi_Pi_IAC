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

    global_secondary_index {
        name               = "DeviceTypeIndex"
        hash_key           = "device_type"
        projection_type    = "ALL"
    }

    attribute {
      name = "device_ip"
      type = "S"
    }

    global_secondary_index {
        name               = "DeviceIpIndex"
        hash_key           = "device_ip"
        projection_type    = "ALL"
    }

    attribute {
        name = "timestamp"
        type = "N"
    }

    global_secondary_index {
        name               = "TimeStampIndex"
        hash_key           = "timestamp"
        projection_type    = "ALL"
    }

    tags = {
        Name = "pi_side_smart_home_pi_devices_serial_numbers"
        Environment = "Production"
    }
}