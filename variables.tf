# Set the variable value in *.tfvars file
# or export TF_VAR_do_token=""
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Set droplet count
variable "droplet_count" {
  type    = number
  default = 3
}

# Set droplet image
variable "droplet_image" {
  type    = string
  default = "ubuntu-20-04-x64"
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