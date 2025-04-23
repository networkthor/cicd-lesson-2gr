environment = "Dev"
key_name = "mentor-admin"
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
ebs_volumes = [{
    device_name = "/dev/sdb"
    volume_size = "10"
    volume_type = "gp3"
    encrypted = true
}]
