terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "local" {
    path = "/Users/hoffmann/Documents/git/coding_challenge/terraform.tfstate"
    # Storing the state file in a s3 bucket would be better than storing it on a locally.
  }
}

variable "include_lambda_module" {
  type        = bool
  description = "Quick and dirty solution to disable a the lambda module"
  default     = true
}

# Configure the AWS Provider for europe
provider "aws" {
  region = "eu-central-1"
  profile = "051392121546_SandboxAccess"
}

module "lambda" {
    source = "./modules/lambda"
    prefix = "hello_world"
    intervall = 5
    count = var.include_lambda_module ? 1 : 0
}