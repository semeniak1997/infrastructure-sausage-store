variable "cloud_id" {
  description = "Cloud ID"
  type = string
  default = "b1g3jddf4nv5e9okle7p"
  nullable = false
}

variable "folder_id" {
  description = "YC platform"
  type = string
  default = "b1gbb7rvko6qb8d27vh6"
  nullable = false
}

variable "provider_zone" {
  description = "Provider availability zone"
  type = string
  default = "ru-central1-a"
  validation {
    condition = contains(toset(["ru-central1-a", "ru-central1-b", "ru-central1-c"]), var.provider_zone)
    error_message = "Select availability zone from the list: ru-central1-a, ru-central1-b, ru-central1-c."
  }
  sensitive = true
  nullable = false
}

