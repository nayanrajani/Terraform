provider "aws" {
  alias   = "account02"
  region  = "ap-southeast-1" //Same for the ami
  profile = "account02"
}

resource "aws_eip" "lb2" {
  provider = aws.account02
  vpc      = true
}
