terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  email     = "nayan.rajani@blazeclan.com"
  api_token = "O_eqbwu3j7w-XcjB0AoG_oUHmXi9rRnuDyP7Mddq"
}

variable "zone_id" {
  default = "0d32a989ca0e8d5e9155163f9f937d2b"
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

/*
//Page rule
// terraform destroy -target cloudflare_page_rule.Page_rule
resource "cloudflare_page_rule" "Page_rule" {
  zone_id  = var.zone_id
  target   = "https://www.greencoin.cf/app/ok/now/*"
  priority = 1
  status   = "active" //active/disabled


  actions {
    cache_key_fields {
      cookie {
        check_presence = ["wordpress_test_cookie"]
      }
      header {
        check_presence = ["header_present"]
        exclude        = ["origin"]
        include        = ["api-key", "dnt"]
      }
      host {
        resolved = true
      }
      query_string {
        ignore = true
      }
      user {
        device_type = false
        geo         = true
        lang        = true
      }
    }
  }
}
*/