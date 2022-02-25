## Digitalocean Terraform

Provision droplet(s) using Terraform.

## Quickstart

- Environment variables
  
    Generate your digitalocean API token: https://cloud.digitalocean.com/account/api/tokens
    ```bash
    export TF_VAR_do_token='digitalocean_token'
    ```
  
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
