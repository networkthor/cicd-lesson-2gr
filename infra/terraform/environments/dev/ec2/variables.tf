variable "region" {
  type = string
  default = "eu-west-1"
}

variable "environment" {
  type = string
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

variable "tags" {
    type = any
    default = {}
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