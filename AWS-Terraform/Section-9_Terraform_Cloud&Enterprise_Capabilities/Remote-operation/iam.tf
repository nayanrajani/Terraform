provider "aws" {
  region     = "ap-south-1" //Same for the ami
  access_key = var.AWS_AccessID
  secret_key = var.AWS_Secret_Access
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}   
