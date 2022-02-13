output "ipv4" {
  value = digitalocean_droplet.this.ipv4_address
}

output "url" {
  value = "https://${cloudflare_record.this.hostname}/gui"
}