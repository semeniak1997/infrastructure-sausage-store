module "yc-instance" {
  source      = "./modules/tf-yc-instance"
  user_data = "${file("scripts/user-data.yaml")}"  
}

output "vm_ip_address" {
  value = module.yc-instance.vm_ip_address
}

output "vm_id" {
  value = module.yc-instance.vm_id
}
