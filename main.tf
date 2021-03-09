# ****************************************************************
# Random Name Generator
# ****************************************************************
resource "random_pet" "name" {}

# ****************************************************************
# Create a new SSH key
# ****************************************************************
# resource "digitalocean_ssh_key" "personal" {
#   name       = "personal"
#   public_key = file("/Users/naim/.ssh/id_rsa.pub")
# }

# ****************************************************************
# Use existing work SSH key
# ****************************************************************
# data "digitalocean_ssh_key" "work" {
#   name  = "work"
# }

# ****************************************************************
# Use existing personal SSH key
# ****************************************************************
data "digitalocean_ssh_key" "personal" {
  name = "thenaim"
}

# ****************************************************************
# Create Droplet(s)
# ****************************************************************
resource "digitalocean_droplet" "this_droplet" {
  count    = var.droplet_count
  image    = var.droplet_image
  name     = "${random_pet.name.id}-${var.region}-${count.index + 1}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.personal.id] # Existing single SSH key
  # ssh_keys = [data.digitalocean_ssh_key.personal.id, data.digitalocean_ssh_key.work.id] # Existing multiple SSH key
  # ssh_keys = [digitalocean_ssh_key.personal.fingerprint] # New SSH key
  user_data = file("user-data.yml")

  # This will help on production environment to prevent downtime
  # lifecycle {
  #   create_before_destroy = true
  # }

}
