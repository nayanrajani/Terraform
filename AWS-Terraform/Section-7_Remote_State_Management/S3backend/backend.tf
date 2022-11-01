terraform {
  backend "s3" {
    bucket = "nayan-terraform-lab"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}
