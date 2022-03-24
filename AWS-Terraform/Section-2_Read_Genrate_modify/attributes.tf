terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" //Same for the ami
  access_key = var.AWS_AccessID
  secret_key = var.AWS_Secret_Access
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "nayan-practice-training-s3"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}

