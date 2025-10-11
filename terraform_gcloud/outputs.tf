output "vm_name" {
   value = module.vm_instance.instance_name
}

output "vm_ip" {
   value = module.vm_instance.instance_nat_ip
}

