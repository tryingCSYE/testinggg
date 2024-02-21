packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = ">= 1.0.0"
    }
  }
}
source "googlecompute" "centos_stream_08" {
  project_id              = var.project_id
  zone                    = var.zone
  source_image_family     = var.source_image_family
  source_image_project_id = [var.source_image_project_id]
  machine_type            = var.machine_type
  ssh_username            = var.ssh_username
  disk_size               = var.disk_size
  disk_type               = var.disk_type
  credentials_file        = var.credentials_file
  image_name              = var.image_name
  use_internal_ip         = false
}

build {
  sources = [
    "source.googlecompute.centos_stream_08"
  ]

  provisioner "file" {
    source      = "/Users/kusumanth/Desktop/webapp.zip"
    destination = "/tmp/webapp.zip"
  }

  provisioner "file" {
    source      = "/Users/kusumanth/Desktop/webapp/webapp.service"
    destination = "/tmp/webapp.service"
  }

  provisioner "shell" {
    script = "/Users/kusumanth/Desktop/webapp/run.sh"
  }

  provisioner "shell" {
    inline = [
      "echo 'Webapp setup complete.'"
    ]
  }
}



