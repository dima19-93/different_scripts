output "instance_name" {
 description = "Name VM"
 value = google_compute_instance.vm.name
}
output "instance_zone" {
 description = "Zona where is VM"
 value = google_compute_instance.vm.zone 
}
output "instance_self_link" {
 description = "self_link resource VM"
 value = google_compute_instance.vm.self_link
}
output "instance_nat_ip" {
 description = "Public IP-address VM"
 value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
