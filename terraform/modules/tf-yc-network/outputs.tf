output "yandex_vpc_networks_id" {
  description = "ID of nework"
  value       = data.yandex_vpc_network.default.id
}

output "yandex_vpc_subnets_names" {
  value = keys(data.yandex_vpc_subnet.default)
}

output "yandex_vpc_subnets_select_id" {
  description = "ID of subnet"
  value = {for zone, subnet in data.yandex_vpc_subnet.default : zone => subnet.id}
}
