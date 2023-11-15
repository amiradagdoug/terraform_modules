variable "region" {
  type    = string
  default = "eu-central-1"
}
variable "user_data_script" {
  type    = string
  default = <<-EOF
              #!/bin/bash
              mkdir /tmp
              echo "Hello from User Data Script" > /tmp/hello.txt
              /usr/bin/aws s3 cp /tmp/hello.txt s3://my-s3-bucket-uo1331iou255/
            EOF
}
