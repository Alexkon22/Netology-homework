variable "vm_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "web_count" {
  type    = number
  default = 2
}

variable "web_resources" {
  type = object({ cores = number, memory = number, core_fraction = number, disk = number })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
    disk          = 5
  }
}

variable "each_vm" {
  type = list(object({ vm_name = string, cpu = number, ram = number, disk_volume = number, core_fraction = number }))
  default = [
    { vm_name = "main", cpu = 2, ram = 2, disk_volume = 6, core_fraction = 20 },
    { vm_name = "replica", cpu = 2, ram = 1, disk_volume = 5, core_fraction = 20 },
  ]
}

variable "storage_disk_count" {
  type    = number
  default = 3
}

variable "storage_disk_size" {
  type    = number
  default = 1
}
