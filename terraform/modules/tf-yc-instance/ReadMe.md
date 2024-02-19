
# Terraform Module: Virtual Machine Instance

This Terraform module allows you to provision a virtual machine instance on the Yandex.Cloud platform with customizable configurations.

## Summary

1. [Variables](#variables)
2. [Resources](#resources)
3. [Outputs](#outputs)
4. [Example Usage](#example-usage)

## Variables

| Variable  | Description  |
| ------------ | ------------ |
| `instance_name`  | The name of the virtual machine instance. Default: `chapter5-lesson2-std-025-02` |
|`instance_zone`  | Instance availability zone. Default: `"ru-central1-a"`. Choose from: `"ru-central1-a", "ru-central1-b", "ru-central1-c"`  |
|  `cores` | The number of CPU cores for the virtual machine instance. Default:` 2`  |
| `memory`  | The amount of memory in GB for the virtual machine instance. Default: `2`  |
| `platform_id`  | The ID of the platform in Cloud for the virtual machine instance. Default: `standard-v1`. Choose from: `"standard-v1", "standard-v2", "standard-v3"`  |
| `image_id`  |  The ID of the image for the virtual machine instance. Default: `fd80qm01ah03dkqb14lc` |
|`disk_size`   | The size of the VM disk in GB. Default: `32`  |
| `preemptible`  |  Planning policy. To create an interruptible VM, specify preemptible = `true`. Default: `true`. |
| `subnet_id`  | The ID of the subnet for the virtual machine instance. Default: `e9bhu4tinqqvhkd1hq5l`  |
|  `user_data` |  The user data for the virtual machine instance. Setup path. |
|  `nat` | Using of Network Address Translation (NAT). Default: `false`.  |

## Resources

#### yandex_compute_instance.vm-1
This resource provisions a Yandex Compute instance based on the provided variables.

##### Attributes


- `name`: The name of the virtual machine instance;

- `platform_id`: The ID of the platform in Cloud for the virtual machine instance;

- `zone`: Instance availability zone;

- `resources`: CPU cores and memory configuration;

- `scheduling_policy`: Preemptible VM configuration;

- `boot_disk`: Boot disk configuration with image ID and size;

- `network_interface`: Network configuration with subnet ID and NAT option;

- `metadata`: User data for the virtual machine instance.

## Outputs

- `instance_ip_address` : The IP address of the provisioned virtual machine instance;
- `instance_id` : The unique ID of the provisioned virtual machine instance.

## Example Usage

#### in root `main.tf`

```HCL
module "yc-instance" {
  source = "./modules/tf-yc-instance"
  instance_name = "my-vm-instance"
  cores = 4
  memory = 8
  platform_id = "standard-v2"
  disk_size = 64
  preemptible = false
  subnet_id = "abcdef1234567890"
  user_data = "${file("scripts/user-data.yaml")}"
  nat = true
}

output "instance_ip_address" {
  value = module.yc-instance.instance_ip_address
}

output "instance_id" {
  value = module.yc-instance.instance_id
}

```
Please replace the values of variables according to your requirements.




