variable "region" {
  type = string
  default = "eu-west-1"
}

variable "environment" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "key_name" {
    type = string
}

variable "volume_size" {
    type = number
    default = 30
}

variable "volume_type" {
    type = string
    default = "gp3"
}

variable "custom_iam_profile" {
    type = string
    default = ""
}

variable "custom_security_group_id" {
    type = string
    default = ""
}

variable "create_vpc" {
  type = bool
  default = "true"
}

variable "create_public_subnets" {
  type = bool
  default = "true"
}

variable "create_private_subnets" {
  type = bool
  default = "true"
}

variable "custom_vpc_id" {
    type = string
    default = ""
}

variable "custom_subnet_id" {
    type = string
    default = ""
}

variable "security_group_rules" {
  type = map(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "user-data-file" {
    type = string
    default = ""
}

variable "associate_public_ip_address" {
    type = bool
    default = false
}

variable "load_balancer_type" {
    default = "application"
    type = string
    description = "Elastic load balancer type"
}

variable "tags" {
    type = any
    default = {}
}

variable "alb_security_group_rules" {
    type = any
    description = "Security group rules"
}

variable "internal" {
    type = bool
    description = "Internal or External ALB"
    default = false
}

variable "listeners" {
  description = "Map of listener configurations to create"
  type        = any
  default     = {}
}

variable "target_groups" {
  description = "Map of target groups configurations to create"
  type        = any
  default     = {}
}

variable "ebs_volumes" {
    type = list(object({
      device_name = string
      volume_size = number
      volume_type = string
      encrypted = bool
    }))
    default = []
}