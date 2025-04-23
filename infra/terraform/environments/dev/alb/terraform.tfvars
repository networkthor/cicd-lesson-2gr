environment = "Dev"
cidr_block="172.28.0.0/16"
key_name = "mentor-admin"
public_subnets = ["172.28.0.0/24", "172.28.1.0/24"]
private_subnets = ["172.28.2.0/24", "172.28.3.0/24"]
security_group_rules = {
    http = {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    https = {
        type        = "ingress"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    all_out = {
        type      = "egress"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
user-data-file = "./user-data.sh.tftpl"
alb_security_group_rules = {
    http = {
        type      = "ingress"
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    https = {
        type      = "ingress"
        from_port = 443
        to_port   = 443
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    all_out = {
        type      = "egress"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
listeners = {
    http = {
        port     = 80
        protocol = "HTTP"
        forward = {}
    }
}
ebs_volumes = [{
    device_name = "/dev/sdb"
    volume_size = "10"
    volume_type = "gp3"
    encrypted = true
}]
