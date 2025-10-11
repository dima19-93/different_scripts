terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

module "vm_instance" {
 source           = "./modules/vm_instance"
 instance_name    = var.instance_name
 network_self_link = module.network.network_self_link
 subnet_self_link = module.network.subnet_self_link
 zone             = var.zone
 machine_type     = var.machine_type
 image_family     = var.image_family
 image_project    = var.image_project
 ssh_user         = var.ssh_user
 ssh_pub_key      = file(var.ssh_pub_key_path)

}
module "network" {
 source           = "./modules/network/"
 network_name     = "vpc-main"
 subnet_name      = "custom-subnet"
 subnet_cidr      = "10.0.0.0/24"
 region           = var.region
}
