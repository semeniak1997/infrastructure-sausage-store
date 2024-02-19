module "yc-instance" {
  source      = "./modules/tf-yc-instance"
 
  user_data = "${file("scripts/user-data.yaml")}"
  image_id = "fd85ee171lecc9gm1ldp"
  instance_zone =  var.select_zone
  subnet_id = module.yc-network.yandex_vpc_subnets_select_id[var.select_zone]
}

module "yc-network" {
  source      = "./modules/tf-yc-network"
}

