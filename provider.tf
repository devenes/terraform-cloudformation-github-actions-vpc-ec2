terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    bucket = "terraform-env-bucket"
    key    = "key/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  # profile = "default"
}
