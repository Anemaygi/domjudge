terraform {
  
  required_version = ">=1.3.7, <1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
