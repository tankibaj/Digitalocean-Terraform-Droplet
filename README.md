## Digitalocean Terraform

A quick terraform guide for setting up droplet with user-data in digitalocean.



## Quickstart

- Clone this repo

  `git clone https://github.com/tankibaj/Digitalocean-Terraform-Droplet.git`

- Generate your digitalocean API token: https://cloud.digitalocean.com/account/api/tokens

  `export TF_VAR_do_token="type_your_token_here"`

- Prepare your working directory for other commands

  `terraform init`

- Show changes required by the current configuration

  `terraform plan`

- Create infrastructure

  `terraform apply`

- Destroy previously created infrastructure

  `terraform destroy`

- Unset token

  `unset TF_VAR_do_token`
