terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  email     = var.email
  api_token = var.token
}

variable "domain" {
  default = "greencoin.cf"
}

// DNS Entry
//terraform destroy -target cloudflare_record.DNS_entry
resource "cloudflare_record" "DNS_entry" {
  zone_id = var.zone_id
  name    = "yup"
  value   = "35.234.81.115"
  type    = "A"
  proxied = true //chanage to true always
}
