terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.22.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}

// creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
  count = var.instance_count
}


resource "google_compute_instance" "default" {
  name         = "test-dev-${random_id.instance_id.*.hex[count.index]}"
  machine_type = var.instance_type
  zone         = var.zone
  count        = var.instance_count

  labels = {
    app = "web"
    env = "dev"
  } 

  boot_disk {
    initialize_params {
      image = var.bootdisk_image
      type = var.bootdisk_type
      size  = var.bootdisk_size
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata = {
    //ssh-keys = "ssh_user:${file(var.ssh_pub_key)}"
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }


}


