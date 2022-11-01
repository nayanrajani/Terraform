terraform {
  backend "s3" {
    bucket = "nayan-terraform-lab"
    key    = "network/demo.tfstate"
    region = "ap-south-1"
    dynamodb_table = "nayan-terraform-table"
  }
}

resource "time_sleep" "wait_200_seconds" {
  create_duration = "150s"  
}