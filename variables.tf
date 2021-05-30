# Set the variable value in *.tfvars file
# or export TF_VAR_do_token=""
# or using -var="do_token=..." CLI option
variable "do_token" {}

variable "droplet_image" {
  type        = string
  default     = "ubuntu-20-04-x64"
  description = "Set the image of droplet"
}

variable "region" {
  type        = string
  default     = "fra1"
  description = "Set the region"
}

# https://developers.digitalocean.com/documentation/v2/#resize-a-droplet
variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "domain" {
  type        = string
  description = "The domain name to use"
}

variable "subdomain_name" {
  type        = string
  description = "The subdomain name what will be create"
}

variable "cloudflare_email" {
  type        = string
  description = "The email associated with the Cloudflare account"
}

variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API Token"
}