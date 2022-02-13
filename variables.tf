# Set the variable value in *.tfvars file
# or export TF_VAR_do_token=""
# or using -var="do_token=..." CLI option
variable "do_token" {}

<<<<<<< HEAD
# Set droplet count
variable "droplet_count" {
  type    = number
  default = 1
=======
variable "zone" {
  type        = string
  description = "The name of domain"
>>>>>>> droplet
}

variable "record" {
  type        = string
  description = "The name of record [subdomain]"
}

variable "cloudflare_email" {
  type        = string
  description = "The email associated with the Cloudflare account"
}

variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API Token"
}
