output "vpc_id" {
  value = try(module.network.vpc_id, "")
}
output "public_subnets_id" {
  value = try(module.network.public_subnets_id, "")
}
output "private_subnets_id" {
  value = try(module.network.private_subnets_id, "")
}