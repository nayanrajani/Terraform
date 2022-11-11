terraform {
  required_version = ">= 1.1.9"

  required_providers {
    aws = { version = ">= 3.70" }
  }

  backend "s3" {
    bucket         = "{Bucket-Name}"
    key            = "{NAME}.tfstate"
    region         = "{REGION}"
    dynamodb_table = "{DYNAMODB TABLE}"
    profile        = "{PROFILE (IF ANY)}"
  }
}

provider "aws" {
  region  = "{REGION}"
  profile = var.ct_management_account_admin_profile
}