# Output details the private IP4 addresses of the eployed droplet(s)
output "droplet_private_ip4_addresses" {
  value = {
    for droplet in digitalocean_droplet.this_droplet:
    droplet.name => droplet.ipv4_address_private
  }
}

# Output details the public IP4 addresses of the eployed droplet(s)
output "droplet_public_ip4_addresses" {
  value = {
    for droplet in digitalocean_droplet.this_droplet:
    droplet.name => droplet.ipv4_address
  }
}