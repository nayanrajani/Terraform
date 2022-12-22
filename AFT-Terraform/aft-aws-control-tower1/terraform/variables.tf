variable "ct_management_account_admin_profile" {
  type        = string
  description = "AWS Profile which has Admin access on Control Tower - Management Account"
}

variable "ct_management_account_id" {
  type        = string
  description = "Control Tower - Management Account ID"
}

variable "log_archive_account_id" {
  type        = string
  description = "Control Tower - Log Archive Account ID"
}

variable "audit_account_id" {
  type        = string
  description = "Control Tower - Audint Account ID"
}

variable "aft_management_account_id" {
  type        = string
  description = "AFT Management Account ID"
}
