module "network" {
  source                 = "github.com/networkthor/terraform-aws-network.git"
  environment            = var.environment
  cidr_block             = var.cidr_block
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  create_vpc             = var.create_vpc
  create_public_subnets  = var.create_public_subnets
  create_private_subnets = var.create_private_subnets
}

module "ec2" {
  source                      = "github.com/networkthor/terraform-aws-ec2.git?ref=add_ebs_config"
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

module "alb" {
  source                   = "../../modules/alb"
  environment              = var.environment
  load_balancer_type       = var.load_balancer_type
  internal                 = var.internal
  vpc_id                   = module.network.vpc_id
  subnets                  = module.network.public_subnets_id
  alb_security_group_rules = var.alb_security_group_rules
  listeners                = var.listeners
  service_protocol         = "HTTP"
  service_port             = 80
  target_id                = module.ec2.instance_id[0]
}