// A variable for extracting the external IP address of the instance
//value = google_compute_instance.default[count.index].network_interface.0.access_config.0.nat_ip
output "ip" {
  value = google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip
}
