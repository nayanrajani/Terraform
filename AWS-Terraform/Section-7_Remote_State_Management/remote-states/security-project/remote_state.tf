data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "nayan-terraform-lab"
    key    = "network/eip.tfstate"
    region = "ap-south-1"
  }
}
