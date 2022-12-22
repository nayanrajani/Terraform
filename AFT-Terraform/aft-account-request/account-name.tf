module "<name>" {

  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "<email>"
    AccountName               = "<Name>"
    ManagedOrganizationalUnit = "OU  (OU number)"
    SSOUserEmail              = "sso-email"
    SSOUserFirstName          = "<first name>"
    SSOUserLastName = "<last Name>"
  }

  account_tags = {

    "account_name" = "tags"

    "creation-date" = "date"

  }

  change_management_parameters = {

    change_requested_by = "<changer>"

    change_reason = "<reason>"

  }

  account_customizations_name = "example-name" // a similar named folder should be created in aft-account-customizations.  

}  
