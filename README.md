# Terraform Module
- Get last snapshot and create AMI EC2.

##### Requirements
- Terraform >=0.13
- Docker 
- Make

##### Use this module.
- Create a terrafile.tf file in the root project, you have this example:
```terraform
provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    # Remember to change the bucket name.
    bucket = "terraform-ezzio"
    key    = "ami.tfstate"
    region = "us-east-2"
  }
}

module "awsami" {
    source = 
    name = "awsami"
}
```
##### For help, type it.
- make help
```make
make terraform-fmt: ## command is used to rewrite Terraform configuration files to an indented format and style
make terraform-validate: ## command validates configuration files
make terraform-init: ## Download all necessary plug-ins
make terraform-plan: ## Executes a terraform plan and places it in a file called plan
make terraform-apply: ## Uses plan to apply changes to AWS.
make terraform-destroy: ## Destroy all resources created by the terraform file.
```
