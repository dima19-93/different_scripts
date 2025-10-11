variable "instance_name" {}
variable "machine_type" {}
variable "image_family" {}
variable "image_project" {}
variable "ssh_user" {}
variable "ssh_pub_key" {}
variable "zone" {
   type = string
}
variable "network_self_link" {
   type = string
   description = "Self link of the VPC network to attach the VM" 
 
}
variable "subnet_self_link" {
   type = string
   description = "Self link of the Subnet to attach the VM"
}
