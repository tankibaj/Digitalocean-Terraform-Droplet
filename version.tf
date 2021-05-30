terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.9.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.21.0"
    }

  }
  backend "remote" {
    organization = "thenaim"

    workspaces {
      name = "digitalocean-droplet-ut"
    }
  }
}

provider "random" {}

provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
}