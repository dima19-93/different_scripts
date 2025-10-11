resource "google_compute_instance" "vm" {
    name         = var.instance_name    
    machine_type = var.machine_type
    zone         = var.zone
   
    boot_disk {
  
       initialize_params {
       image = "${var.image_project}/${var.image_family}"
    }
 }

    network_interface {
   
       network = var.network_self_link
       subnetwork = var.subnet_self_link
       access_config {}

 }
    metadata = {
     ssh_keys = "${var.ssh_user}:${var.ssh_pub_key}"
 }

}
  
