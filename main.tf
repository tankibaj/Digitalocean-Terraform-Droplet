
# Tell terraform which provider to use.
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# # Create a new SSH key
# resource "digitalocean_ssh_key" "personal" {
#   name       = "personal"
#   public_key = file("/Users/naim/.ssh/id_rsa.pub")
# }

# # Use existing work SSH key
# data "digitalocean_ssh_key" "work" {
#   name  = "work"
# }

# Use existing personal SSH key
data "digitalocean_ssh_key" "personal" {
  name  = "thenaim"
}

# Set droplet count
variable "droplet_count" {
  type    = number
  default = 1
}

# Set droplet image
variable "droplet_image" {
  type    = string
  default = "ubuntu-18-04-x64"
}

# Set region
variable "region" {
  type    = string
  default = "fra1"
}

# Set droplet size
variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}


# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "webapp" {
  count    = var.droplet_count
  image    = var.droplet_image
  name     = "instance-${var.region}-${count.index +1}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.personal.id] # Existing single SSH key
  # ssh_keys = [data.digitalocean_ssh_key.personal.id, data.digitalocean_ssh_key.work.id] # Existing multiple SSH key
  # ssh_keys = [digitalocean_ssh_key.personal.fingerprint] # New SSH key

  # This will help on production environment to prevent downtime
  lifecycle {
    create_before_destroy = true
  }

}

# Output details the private IP4 addresses of the eployed droplet(s)
output "droplet_private_ip4_addresses" {
  value = {
    for droplet in digitalocean_droplet.webapp:
    droplet.name => droplet.ipv4_address_private
  }
}

# Output details the public IP4 addresses of the eployed droplet(s)
output "droplet_public_ip4_addresses" {
  value = {
    for droplet in digitalocean_droplet.webapp:
    droplet.name => droplet.ipv4_address
  }
}
