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


# resource "aws_instance" "ec2" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.micro"
# }


# resource "aws_eip" "lb" {
#   vpc = true
# }

# output "eip" {
#   value = aws_eip.lb.public_ip
# }

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.ec2.id
#   allocation_id = aws_eip.lb.id
# }

# resource "aws_s3_bucket" "mys3" {
#   bucket = "nayan-practice-training-s3"
# }

# output "mys3bucket" {
#   value = aws_s3_bucket.mys3.bucket_domain_name
# }

# resource "aws_security_group" "allow_tls" {
#   name = "Nayan-sample"

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
#     #cidr_blocks = [aws_eip.lb.public_ip/32] it will give an error
#   }
#   tags = {
#     Name = "just checking"
#   }
# }

# # Data types for variables

# resource "aws_elb" "bar" {
#   name               = var.elb_name
#   availability_zones = var.az

#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:8000/"
#     interval            = 30
#   }

#   cross_zone_load_balancing   = true
#   idle_timeout                = var.timeout
#   connection_draining         = true
#   connection_draining_timeout = var.timeout

#   tags = {
#     Name = "foobar-terraform-elb"
#   }
# }

# # Fetch data from List and Map
# resource "aws_instance" "myec2" {
#    ami = "ami-082b5a644766e0e6f"
#    instance_type = var.list[1]
# }
# resource "aws_instance" "myec21" {
#    ami = "ami-082b5a644766e0e6f"
#    instance_type = var.types["us-west-2"]
# }

# variable "list" {
#   type = list
#   default = ["m5.large","m5.xlarge","t2.medium"]
# }

# variable "types" {
#   type = map
#   default = {
#     us-east-1 = "t2.micro"
#     us-west-2 = "t2.nano"
#     ap-south-1 = "t2.small"
#   }
# }

# # Count Parameter

# resource "aws_instance" "myec21" {
#   ami           = "ami-082b5a644766e0e6f"
#   instance_type = "t2.micro"
#   count         = 5
# }

# # count index

# resource "aws_iam_user" "lb" {
#   name  = "loadbalancer.${count.index}"
#   count = 2
#   path = "/system/"
# }

# # With naming convention
# resource "aws_iam_user" "lb" {
#   name  = var.elb_names[count.index]
#   count = 3
#   path = "/system/"
# }

# # Conditional Expression
# variable "istest" {}

# resource "aws_instance" "dev" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.micro"
#   count = var.istest == true ? 1 : 0
# }

# resource "aws_instance" "prod" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.large"
#   count = var.istest == false ? 1 : 0
# }

# # Local Value

# resource "aws_instance" "app-dev" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.micro"
#   tags = local.common_tags
# }

# resource "aws_instance" "db-dev" {

#   ami           = "ami-01216e7612243e0ef" //If it is not working change the region and then try
#   instance_type = "t2.large"
#   tags = local.common_tags
# }

# # Terraform Functions
# ##### provider "aws" {
# #####   region     = var.region
# #####   access_key = "YOUR-ACCESS-KEY"
# #####   secret_key = "YOUR-SECRET-KEY"
# ##### }

# locals {
#   time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
# }

# variable "region" {
#   default = "ap-south-1"
# }

# variable "tags" {
#   type = list
#   default = ["firstec2","secondec2"]
# }

# variable "ami" {
#   type = map
#   default = {
#     "us-east-1" = "ami-0323c3dd2da7fb37d"
#     "us-west-2" = "ami-0d6621c01e8c2de2c"
#     "ap-south-1" = "ami-0470e33cd681b2476"
#   }
# }

# resource "aws_key_pair" "loginkey" {
#   key_name   = "login-key"
#   public_key = file("${path.module}/id_rsa.pub") //file function - reads the content of a file at the given path and returns them a string
# }

# resource "aws_instance" "app-dev" {
#    ami = lookup(var.ami,var.region)  //lookup function- retrives the value of a single element from a map given its key.
#    instance_type = "t2.micro"
#    key_name = aws_key_pair.loginkey.key_name
#    count = 2

#    tags = {
#      Name = element(var.tags,count.index) //Element Function- retrives the value of a single element from a List
#    }
# }


# output "timestamp" {  // timestamp function - retriving something in a formatted way.
#   value = local.time
# }

# Data Sources