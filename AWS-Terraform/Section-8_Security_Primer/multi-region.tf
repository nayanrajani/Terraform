provider "aws" {
  region = "ap-south-1" //Same for the ami

}

resource "aws_eip" "lb" {
  vpc = true
}

provider "aws" {
  alias  = "Singapore"
  region = "ap-southeast-1" //Same for the ami

}

resource "aws_eip" "lb1" {
  provider = aws.Singapore
  vpc      = true
}
