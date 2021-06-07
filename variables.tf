variable "project" { }

variable "credentials_file" { }

variable "region" {
  default = "us-west1"
}

variable "zone" {
  default = "us-west1-b"
}

variable "instance_count" {
  default = "5"
}

variable "instance_type" {
  default = "e2-small"
}

variable "bootdisk_size" {
  default = "20"
}

variable "bootdisk_type" {
  default = "pd-standard"
}

variable "bootdisk_image" {
  default = "centos-7"
}

variable "ssh_user" { }

variable "ssh_pub_key" { }

variable "service_account_email" { }
