module "ec2" {
  source = "./modules/ec2"

  instance_profile = module.role.instance_role_name

  user_data = var.user_data_script
}

module "s3" {
  source = "./modules/s3"

  bucket_name               = "my-s3-bucket-uo1331iou255"
  bucket_encryption_enabled = true
}

module "role" {
  source = "./modules/iam"

  role_name        = "MyEC2InstanceRole1"
  policy_actions   = ["s3:*"]
  policy_effect    = "Allow"
  policy_resources = [module.s3.bucket_arn, "${module.s3.bucket_arn}/*"]
}
