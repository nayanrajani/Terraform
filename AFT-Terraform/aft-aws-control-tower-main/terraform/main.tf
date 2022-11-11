module "aft_pipeline" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"

  # Required Variables
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = "{MAIN REGION}"
  tf_backend_secondary_region = "{SECONDARY REGION}"

  # Terraform Variables
  terraform_version      = "1.1.9"
  terraform_distribution = "oss"

  # VCS Variables
  vcs_provider                                  = "github"
  account_customizations_repo_name              = "{REPO-NAME}/aft-account-customizations"
  account_provisioning_customizations_repo_name = "{REPO-NAME}/aft-account-provisioning-customizations"
  account_request_repo_name                     = "{REPO-NAME}/aft-account-request"
  global_customizations_repo_name               = "{REPO-NAME}/aft-global-customizations"

  # AFT Feature Flags
  aft_vpc_endpoints                       = false
  aft_feature_delete_default_vpcs_enabled = true

  # AFT VPC Specs
  aft_vpc_cidr                   = "{CIDR-RANGE/SUBNET}"
  aft_vpc_private_subnet_01_cidr = "{CIDR-RANGE/SUBNET}"
  aft_vpc_private_subnet_02_cidr = "{CIDR-RANGE/SUBNET}"
  aft_vpc_public_subnet_01_cidr  = "{CIDR-RANGE/SUBNET}"
  aft_vpc_public_subnet_02_cidr  = "{CIDR-RANGE/SUBNET}"
}