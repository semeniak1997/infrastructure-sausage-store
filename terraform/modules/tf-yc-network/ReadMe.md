
# Terraform Module: Yandex Cloud Network

This Terraform module facilitates the creation of a Yandex Cloud VPC (Virtual Private Cloud) network with associated subnets across different availability zones.

## Summary

1. [Variables](#variables)
2. [Resources](#resources)
3. [Outputs](#outputs)
4. [Example Usage](#example-usage)

## Variables

- `network_zones` : List of network zones. Default: `["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"]`.

## Resources

#### data.yandex_vpc_network.default
This data source retrieves information about the default Yandex VPC network.

##### Attributes


- `name`: Name of the default VPC network.

#### data.yandex_vpc_subnet.default
This data source dynamically generates information about subnets based on the specified network zones.

##### Attributes

- `name`: Name of the subnet, formed by combining the default network name with the zone.
- `for_each`: Looping over network zones to generate subnets for each zone.

## Outputs

- `yandex_vpc_networks_id` : ID of the created Yandex VPC network;
- `yandex_vpc_subnets_names` : List of subnet names created in the default VPC network;
- `yandex_vpc_subnets_select_id` : ID of each subnet associated with its respective network zone.

## Example Usage

#### in root `main.tf`

```HCL
module "yc-network" {
  source      = "./modules/tf-yc-network"
}

module "yc-instance" {
 subnet_id = module.yc-network.yandex_vpc_subnets_select_id["ru-central1-b"]
}

output "network_id" {
  value = module.yc-network.yandex_vpc_networks_id
}

output "subnet_names" {
  value = module.yc-network.yandex_vpc_subnets_names
}

```
Ensure to adjust the `network_zones` variable according to your specific requirements.




