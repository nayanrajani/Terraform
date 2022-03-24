variable "AWS_AccessID" {
  default = "AKIA5FOTFZWZFYACZPUT"
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