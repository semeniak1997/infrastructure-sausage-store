output "instance_ip_address" {
  value = module.yc-instance.instance_ip_address
}

output "instance_id" {
  value = module.yc-instance.instance_id
}

output "network_id" {
  value = module.yc-network.yandex_vpc_networks_id
}

output "subnet_names" {
  value = module.yc-network.yandex_vpc_subnets_names
}

