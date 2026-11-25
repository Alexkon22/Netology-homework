data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "web" {
  count       = var.web_count
  depends_on  = [yandex_compute_instance.db]
  name        = "web-${count.index + 1}"
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
      type     = "network-ssd"
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
