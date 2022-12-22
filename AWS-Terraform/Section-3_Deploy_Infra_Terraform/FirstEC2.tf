terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    pgp = {
      source = "ekristen/pgp"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-south-1" //Same for the ami
  access_key = var.AWS_AccessID
  secret_key = var.AWS_Secret_Access
}


resource "aws_instance" "ec2" {

  ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
  instance_type = "t2.micro"
}

