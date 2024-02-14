
resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-std-025-02"

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  network_interface {
    subnet_id = "e9bhu4tinqqvhkd1hq5l"
    nat = false
  }

  metadata = {
	user-data = "${file("scripts/user-data.yaml")}"
  }
}

output "ip_address" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
