variable "instance_name" {
  description = "The name of the virtual machine instance"
  type = string
  default = "chapter5-lesson2-std-025-02"
}

variable "instance_zone" {
  description = "Instance availability zone"
  type = string
  default = "ru-central1-a"
  validation {
    condition = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"]), var.instance_zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  nullable = false
}

variable "cores" {
  description = "The number of CPU cores for the virtual machine instance"
  type = number
  default = 2
  nullable = false
}

variable "memory" {
  description = "The amount of memory in GB for the virtual machine instance"
  type = number
  default = 2
  nullable = false
}

variable "platform_id" {
  description = "The ID of the platform in Cloud for the virtual machine instance"
  type = string
  default = "standard-v1"
  validation {
    condition = contains(toset(["standard-v1", "standard-v2", "standard-v3"]), var.platform_id)
    error_message = "Select availability platform from the list: standard-v[1,2,3]"
  }
  nullable = false
}

variable "image_id" {
  description = "The ID of the image for the virtual machine instance"
  type = string
  default = "fd80qm01ah03dkqb14lc"
}

variable "disk_size" {
  description = "The Size of VM disk in GB"
  type = number
  default = 32
}

variable "preemptible" {
  description = "Planning policy. To create an interruptible VM, specify preemptible = true"
  type = bool
  default = true
}

variable "subnet_id" {
  description = "The ID of the subnet for the virtual machine instance"
  type = string
  default = "e9bhu4tinqqvhkd1hq5l"
}

variable "user_data" {
  description = "The user data for the virtual machine instance"
}

variable "nat" {
  description = "Using of Network Address Translation (NAT)"
  type = bool
  default = false
}
