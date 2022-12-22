terraform {
  required_version = ">= 1.1.9"

  required_providers {
    aws = { version = ">= 3.70" }
  }

  backend "s3" {
    bucket         = "{bucket-name}"
    key            = "terraform.tfstate"
    region         = "{region}"
    dynamodb_table = "{table-name}"
    profile        = "aft-account"
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "master-account"
}