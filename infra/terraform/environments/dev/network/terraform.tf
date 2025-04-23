terraform {
  backend "s3" {
    bucket = "nurkhat-terraform-states"
    key    = "dev/network-new/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "nurkhat-terraform-lock-table"
  }
}