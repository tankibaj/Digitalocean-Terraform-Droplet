## Digitalocean Terraform

Provision droplet(s) using Terraform and Cloud-init.

User-data is arbitrary data that a user can supply to a Droplet during its creation time. User-data can be consumed by CloudInit, typically during the first boot of a cloud server, to perform tasks or run scripts as the root user–this can be extremely useful when provisioning a server.


## Quickstart

<<<<<<< HEAD
- Generate your digitalocean API token: https://cloud.digitalocean.com/account/api/tokens

  `export TF_VAR_do_token="type_your_token_here"`
=======

- Environment variables
  
    Generate your digitalocean API token: https://cloud.digitalocean.com/account/api/tokens
    ```bash
    export TF_VAR_do_token='digitalocean_token'
    export TF_VAR_cloudflare_email='cloudflare_email'
    export TF_VAR_cloudflare_api_token='cloudflare_api_token'
    export TF_VAR_zone='domain_name'
    export TF_VAR_record='subdomain'
    ```
>>>>>>> droplet

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
