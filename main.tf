provider "aws" {
    region              = local.aws_default_region
    secret_key          = var.aws_secret_access_key
    access_key          = var.aws_access_key_id
}

provider "sendgrid" {
    api_key = var.sendgrid_api_key
}

terraform {
    required_version = ">= 1.0.10"

    required_providers {
        local = {
            source = "hashicorp/local"
            version = ">= 2.1.0"
        }
        aws = {
            source = "hashicorp/aws"
            version = ">= 3.64.2"
        }
        sendgrid = {
            source = "trois-six/sendgrid"
            version = ">= 0.1.6"
        }
    }
    backend "s3" {
        bucket = "stateful-trivialsec"
        key    = "terraform/sendgrid"
        region  = "ap-southeast-2"
    }
}
