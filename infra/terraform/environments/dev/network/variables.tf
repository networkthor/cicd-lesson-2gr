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

variable "tags" {
    type = any
    default = {}
}