# Overview

This repository contains the core configuration for the AWS Account Factory for Terraform module
(AFT). AFT defines a pipeline for automated and consistent creation of AWS Control Tower accounts,
providing us both the benefits of Terraform's workflow and Control Tower's governance features.

AFT requires working across **5** repositories; one for the AFT module deployment and **4** that
AFT module requires in order to define the account specifications in. We only need to run Terraform
commands within the first repository, since AFT will create the appropriate pipelines and execute
the configuration in the account specification repositories automatically.

The rest four account configuration repositories are the following:

- The [aft-account-request](https://github.com/skroutz/aft-account-request) repository, which
  contains example configuration to kick off new account provisioning using AFT.
- The [aft-global-customizations](https://github.com/skroutz/aft-global-customizations) repository,
  which contains boilerplate configuration for customizations to apply to all accounts created by
  AFT.
- The [aft-account-customizations](https://github.com/skroutz/aft-account-customizations)
  repository, which contains boilerplate configuration for account-specific customizations.
- The [aft-account-provisioning-customizations](https://github.com/skroutz/aft-account-provisioning-customizations)
  repository, which contains boilerplate configuration for provisioning-time customizations to
  apply to accounts.

AFT supports multiple VCS providers (AWS CodeCommit, Github, Bitbucket, and GitHub Enterprise
Server) for the required repositories. By default, it uses AWS CodeCommit however we chose to
proceed with *GitHub*.

# Deploy AFT

There are detailed instruction on how to deploy the AFT module in the respective [AWS
Guide](https://docs.aws.amazon.com/controltower/latest/userguide/taf-account-provisioning.html).
There's also a quite handy tutorial on how to setup and manage account via the AFT module which is
written by
[HashiCorp](https://learn.hashicorp.com/tutorials/terraform/aws-control-tower-aft?in=terraform/aws).
