# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features{}
  
  subscription_id = "b8b59651-61a8-4d3f-8480-a2f4365543cd"
}


# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
# Create a Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "my-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}
# Create a Subnet
resource "azurerm_subnet" "example" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}
# Create a Public IP Address
resource "azurerm_public_ip" "example" {
  name                = "my-public-ip"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
}
# Create a Network Interface
resource "azurerm_network_interface" "example" {
  name                = "my-nic"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

# Create a Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  name                            = "my-vm"
  admin_username                  = "azureuser"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_B1s"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  network_interface_ids = [azurerm_network_interface.example.id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
# Replace with your actual SSH key path
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

}
