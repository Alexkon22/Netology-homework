resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_disk_count
  name  = "disk-${count.index + 1}"
  size  = var.storage_disk_size
  type  = "network-hdd"
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.web_resources.cores
    memory        = var.web_resources.memory
    core_fraction = var.web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.web_resources.disk
      type     = "network-hdd"
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.metadata
}
