module "network" {
  source                 = "git@github.com:networkthor/terraform-aws-network.git"
  environment            = var.environment
  cidr_block             = var.cidr_block
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  create_vpc             = var.create_vpc
  create_public_subnets  = var.create_public_subnets
  create_private_subnets = var.create_private_subnets
}