module "ec2" {
  source                      = "github.com/networkthor/terraform-aws-ec2.git"
  environment                 = var.environment
  instance_count              = 1
  instance_type               = var.instance_type
  key_name                    = var.key_name
  volume_size                 = var.volume_size
  volume_type                 = var.volume_type
  custom_iam_profile          = var.custom_iam_profile
  custom_vpc_id               = module.network.vpc_id
  custom_subnet_id            = module.network.private_subnets_id[0]
  security_group_rules        = var.security_group_rules
  custom_security_group_id    = var.custom_security_group_id
  user-data-file              = var.user-data-file
  associate_public_ip_address = var.associate_public_ip_address
  ebs_volumes                 = var.ebs_volumes
}