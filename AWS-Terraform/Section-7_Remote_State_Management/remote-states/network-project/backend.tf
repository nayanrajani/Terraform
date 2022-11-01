terraform {
  backend "s3" {
    bucket = "nayan-terraform-lab"
    key    = "network/eip.tfstate"
    region = "ap-south-1"
  }
}
