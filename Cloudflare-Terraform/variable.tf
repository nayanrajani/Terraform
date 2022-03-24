variable "zone_id" {
  description = "Please enter Zone ID"
  type        = string
  sensitive = true
  default = "<Zone ID>"  //zone id
}

variable "account_id" {
  description = "Please enter Account ID"
  type        = string
  sensitive = true
  default = "<Account ID>"  //Account id
}

variable "token" {
  description = "Please enter dns"
  type        = string
  sensitive   = true
  default     = "<Token>"  //Common Token
}
variable "email" {
  description = "Please enter email"
  type        = string
  sensitive   = true
  default     = "<Email>"
}

