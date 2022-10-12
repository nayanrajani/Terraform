variable "AWS_AccessID" {
  sensitive = true
  type = string
  description = "Please enter Access id"
  default = "<Please Enter your Keys here>"
}

variable "AWS_Secret_Access"{
    sensitive = true
    type = string
    description = "Please enter Token id"
    default = "<Please Enter your Keys here>"
}