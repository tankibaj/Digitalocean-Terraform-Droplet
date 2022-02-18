locals {
  host_name = "droplet"
  user_name = "naim"
}

resource "random_pet" "name" {}

data "digitalocean_ssh_key" "personal" {
  name = "thenaim"
}

resource "digitalocean_droplet" "this" {
  image     = "ubuntu-20-04-x64"
  name      = random_pet.name.id
  region    = "fra1"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [data.digitalocean_ssh_key.personal.id]
  user_data = templatefile("${path.module}/user-data.yaml", { HOST_NAME = local.host_name, USERNAME = local.user_name })
}

data "cloudflare_zones" "domain" {
  filter {
    name = var.zone
  }
}

resource "cloudflare_record" "this" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = var.record
  value   = digitalocean_droplet.this.ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}