# ****************************************************************
# Random Name Generator
# ****************************************************************
resource "random_pet" "name" {}

# ****************************************************************
# Use existing personal SSH key
# ****************************************************************
data "digitalocean_ssh_key" "personal" {
  name = "thenaim"
}

# ****************************************************************
# Create Droplet(s)
# ****************************************************************
resource "digitalocean_droplet" "this" {
  image    = var.droplet_image
  name     = "${random_pet.name.id}-${var.region}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.personal.id]
  user_data = file("user-data.yml")
}

# ****************************************************************
# Fetch Cloudflare zones data
# ****************************************************************
data "cloudflare_zones" "domain" {
  filter {
    name = var.domain
  }
}

# ****************************************************************
# Create Cloudflare A record
# ****************************************************************
resource "cloudflare_record" "this" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = var.subdomain_name
  value   = digitalocean_droplet.this.ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}