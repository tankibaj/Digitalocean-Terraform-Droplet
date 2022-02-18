output "ipv4" {
  value = digitalocean_droplet.this.ipv4_address
}

output "url" {
  value = cloudflare_record.this.hostname
}