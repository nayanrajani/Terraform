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
  region     = "ap-south-1" //Same for the ami
  access_key = var.AWS_AccessID
  secret_key = var.AWS_Secret_Access
}


resource "aws_instance" "ec2" {

  ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
  instance_type = "t2.micro"
}


resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_s3_bucket" "mys3" {
  bucket = "nayan-practice-training-s3"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}

resource "aws_security_group" "allow_tls" {
  name = "Nayan-sample"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    #cidr_blocks = [aws_eip.lb.public_ip/32] it will give an error
  }
  tags = {
    Name = "just checking"
  }
}
