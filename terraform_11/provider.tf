terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  
  }
  required_version = "~>1.3.0"

}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = var.tags
  }
}

