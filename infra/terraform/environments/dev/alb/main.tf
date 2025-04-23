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