variable "usernumber" {
  type = number
}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list(any)
}

variable "timeout" {
  type = number
}
variable "istest" {
  type = number
}

variable "elb_names" {
  type    = list(any)
  default = ["dev-lb", "stage-lb", "prod-lb"]

}
