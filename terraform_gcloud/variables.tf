variable "project_id" {}
variable "region"     {}
variable "zone"        {}
variable "instance_name" {}
variable "machine_type"  {
  default = "e2-medium"
}
variable "image_family"{
  description = "Image для створення VM"
  type = string
  default = "ubuntu-2204-lts"
}
variable "image_project" {
  default = "ubuntu-os-cloud"
}
variable "ssh_user" {
  default = "adminserver"
}
variable "ssh_pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
