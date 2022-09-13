variable "AWS_AccessID" {
  default = "Please enter Token id"
  sensitive = true
  type = string
  description = "<Please Enter your Keys here>"
}

variable "AWS_Secret_Access"{
    sensitive = true
    type = string
    description = "Please enter Token id"
    default = "<Please Enter your Keys here>"
}